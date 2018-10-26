module TeachersHelper

  # For filter teacher dropdown
  def filter_teacher_dropdown
    [
      ['Contains','contain'],
      ['Equals','equals'],
      ['Starts with','start_with'],
      ['Ends with','end_with']
    ]

  end

  # Teacher filter method
  def teacher_filter
    if params[:q].present?
      count = 0
      query_array = []
      query = ""
      if params[:name].present?
        if params[:q][:name_contains] == "contain"
          count = count + 1
          query += " name like ? "
          query_array << "%#{params[:name]}%"
        elsif params[:q][:name_contains] == "equals"
          count = count + 1
          query += " name = ? "
          query_array << params[:name]

        elsif params[:q][:name_contains] == "start_with"
          count = count + 1
          query += " name LIKE ? "
          query_array << "#{params[:name]}%"
        elsif params[:q][:name_contains] == "end_with"
          count = count + 1
          query += " name LIKE ? "
          query_array << "%#{params[:name]}"
        end
      end
      if count > 0 && params[:email].present?
        if params[:q][:email_contains] == "contain"
          query += " AND email like ? "
          query_array << "%#{params[:email]}%"
        elsif params[:q][:email_contains] == "equals"
          query += " AND email = ? "
          query_array << params[:email]
        elsif params[:q][:email_contains] == "start_with"
          query += " AND email like ? "
          query_array << "#{params[:email]}%"
        elsif params[:q][:email_contains] == "end_with"
          query += " AND email like ? "
          query_array << "%#{params[:email]}"
        end
      elsif params[:email].present?
        if params[:q][:email_contains] == "contain"
          query += " email like ? "
          query_array << "%#{params[:email]}%"
        elsif params[:q][:email_contains] == "equals"
          query += " email = ? "
          query_array << params[:email]
        elsif params[:q][:email_contains] == "start_with"
          query += " email like ? "
          query_array << "#{params[:email]}%"
        elsif params[:q][:email_contains] == "end_with"
          query += " email like ? "
          query_array << "%#{params[:email]}"
        end
      end
      if count > 0 && params[:crb_checked].present?
        query += " AND crb_checked = ? "
        if  params[:crb_checked] == "true"
        query_array << true
        else
          query_array << false
        end
      elsif params[:crb_checked].present?
        query += " crb_checked = ? "
        if  params[:crb_checked] == "true"
        query_array << true
        else
          query_array << false
        end
      end
      if count > 0 && params[:employee_number].present?
        if params[:q][:employee_number_contains] == "contain"
          query += " AND employee_number like ? "
          query_array << "%#{params[:employee_number]}%"
        elsif params[:q][:employee_number_contains] == "equals"
          query += " AND employee_number = ? "
          query_array << params[:employee_number]
        elsif params[:q][:employee_number_contains] == "start_with"
          query += " AND employee_number like ? "
          query_array << "#{params[:employee_number]}%"
        elsif params[:q][:employee_number_contains] == "end_with"
          query += " AND employee_number like ? "
          query_array << "%#{params[:employee_number]}"
        end
      elsif params[:employee_number].present?
        if params[:q][:employee_number_contains] == "contain"
          query += " employee_number like ? "
          query_array << "%#{params[:employee_number]}%"
        elsif params[:q][:employee_number_contains] == "equals"
          query += " employee_number = ? "
          query_array << params[:employee_number]
        elsif params[:q][:employee_number_contains] == "start_with"
          query += " employee_number like ? "
          query_array << "#{params[:employee_number]}%"
        elsif params[:q][:employee_number_contains] == "end_with"
          query += " employee_number like ? "
          query_array << "%#{params[:employee_number]}"
        end
      end
      if count > 0 && params[:contract_type].present?
        query += " AND contract_type = ? "
        query_array << params[:contract_type]
      elsif params[:contract_type].present?
        query += " contract_type = ? "
        query_array << params[:contract_type]
      end
      full_query = query_array.unshift(query)
      @teachers = Teacher.where(full_query)
      @ids = @teachers.collect(&:id)
      if full_query == [""]
        return @teachers
      end
    else
    end
  end
end
