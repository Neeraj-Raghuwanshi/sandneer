module StudentsHelper

  # For filter dropdowns
  def student_filter_name
    [
      ['Contains','contain'],
      ['Equals','equals'],
      ['Starts with','start_with'],
      ['Ends with','end_with']
    ]

  end

  def ethnicity_group
    [
      ["Indian","indian"],
      ["Pakistani","pakistani"],
      ["Bangladeshi","bangladeshi"],
      ["Afghan","afgan"],
      ["Arab","arab"],
      ["Any other Asian background","any_other_asian_background"],
      ["Caribbean","caribbean"],
      ["African","african"],
      ["Any other Black background","any_other_black_background"],
      ["White and Black Caribbean","white_and_black_caribbean"],
      ["White and Black African","white_and_black_african"],
      ["White and Asian","whiete_and_asian"],
      ["Any other mixed background","any_other_mixed_background"],
      ["Chinese","chinese"],
      ["British","british"],
      ["Irish","irish"],
      ["Indonesian","indonesian"],
      ["Any other White background","any_other_white_background"],
      ["Any other ethnic group","any_other_ethnic_group"]
    ]
  end

  # Batch actions
  def student_batch_action
    [
      ['Batch Action',''],
      ['Change class','change_class'],
      ['Change status','change_status'],
      ['Update fee','update_fee'],
      ['Give Permission','give_permission'],
      ['Delete','delete_selected'],
    ]
  end

  # Filter method
  def filter_student
    if params[:q].present?
      count = 0
      query_array = []
      query = ""
      query_array1 = []
      query1 = ""
      if params[:first_name].present?
        if params[:q][:first_name_contains] == "contain"
          count = count + 1
          query += " first_name like ? "
          query_array << "%#{params[:first_name]}%"
        elsif params[:q][:first_name_contains] == "equals"
          count = count + 1
          query += " first_name = ? "
          query_array << params[:first_name]

        elsif params[:q][:first_name_contains] == "start_with"
          count = count + 1
          query += " first_name LIKE ? "
          query_array << "#{params[:first_name]}%"
        elsif params[:q][:first_name_contains] == "end_with"
          count = count + 1
          query += " first_name LIKE ? "
          query_array << "%#{params[:first_name]}"
        end
      end
      if count > 0 && params[:last_name].present?
        if params[:q][:last_name_contains] == "contain"
          query += " AND last_name like ? "
          query_array << "%#{params[:last_name]}%"
        elsif params[:q][:last_name_contains] == "equals"
          query += " AND last_name = ? "
          query_array << params[:last_name]
        elsif params[:q][:last_name_contains] == "start_with"
          query += " AND last_name like ? "
          query_array << "#{params[:last_name]}%"
        elsif params[:q][:last_name_contains] == "end_with"
          query += " AND last_name like ? "
          query_array << "%#{params[:last_name]}"
        end
      elsif params[:last_name].present?
        if params[:q][:last_name_contains] == "contain"
          query += " last_name like ? "
          query_array << "%#{params[:last_name]}%"
        elsif params[:q][:last_name_contains] == "equals"
          query += " last_name = ? "
          query_array << params[:last_name]
        elsif params[:q][:last_name_contains] == "start_with"
          query += " last_name like ? "
          query_array << "#{params[:last_name]}%"
        elsif params[:q][:last_name_contains] == "end_with"
          query += " last_name like ? "
          query_array << "%#{params[:last_name]}"
        end
      end
      if count > 0 && params[:gender].present?
        query += " AND gender = ? "
        query_array << params[:gender]
      elsif params[:gender].present?
        query += " gender = ? "
        query_array << params[:gender]
      end
      if count > 0 && params[:ethnicity_group].present?
        query += " AND ethnicity_group = ? "
        query_array << params[:ethnicity_group]
      elsif params[:ethnicity_group].present?
        query += " ethnicity_group = ? "
        query_array << params[:ethnicity_group]
      end
      if count > 0 && params[:student_ref].present?
        if params[:q][:student_ref_contains] == "contain"
          query += " AND student_ref like ? "
          query_array << "%#{params[:student_ref]}%"
        elsif params[:q][:student_ref_contains] == "equals"
          query += " AND student_ref = ? "
          query_array << params[:student_ref]
        elsif params[:q][:student_ref_contains] == "start_with"
          query += " AND student_ref like ? "
          query_array << "#{params[:student_ref]}%"
        elsif params[:q][:student_ref_contains] == "end_with"
          query += " AND student_ref like ? "
          query_array << "%#{params[:student_ref]}"
        end
      elsif params[:student_ref].present?
        if params[:q][:student_ref_contains] == "contain"
          query += " student_ref like ? "
          query_array << "%#{params[:student_ref]}%"
        elsif params[:q][:student_ref_contains] == "equals"
          query += " student_ref = ? "
          query_array << params[:student_ref]
        elsif params[:q][:student_ref_contains] == "start_with"
          query += " student_ref like ? "
          query_array << "#{params[:student_ref]}%"
        elsif params[:q][:student_ref_contains] == "end_with"
          query += " student_ref like ? "
          query_array << "%#{params[:student_ref]}"
        end
      end
      if count > 0 && params[:parent_id].present?
        query += " AND parent_id = ? "
        query_array << params[:parent_id]
      elsif params[:parent_id].present?
        query += " parent_id = ? "
        query_array << params[:parent_id]
      end
      if count > 0 && params[:type_id].present?
        query += " AND type_id = ? "
        query_array << params[:type_id]
      elsif params[:type_id].present?
        query += " type_id = ? "
        query_array << params[:type_id]
      end
      if params[:dob][:start_date].present? && params[:dob][:end_date].present?
        query += " dob BETWEEN ? AND ? "
        query_array << params[:dob][:start_date]
        query_array << params[:dob][:end_date]
      elsif count > 0 && params[:dob][:start_date].present? && params[:dob][:end_date].present?
        query += " AND dob BETWEEN ? AND ? "
        query_array << params[:dob][:start_date]
        query_array << params[:dob][:end_date]
      end
      if params[:level_name].present?
        query1 += "name = ? "
        query_array1 << params[:level_name]
      end
      full_query = query_array.unshift(query)
      full_query1 = query_array1.unshift(query1)
      if query.empty?
      else
        @students = Student.where(full_query)
      end
      @levels = LevelsStudent.where(level_id:Level.find_by(name:params[:level_name]).try(:id))
      student_ids = []
      @levels.each do |level|
        id = level.student_id
        student_ids.push(id)
      end
      @student = Student.where(id: student_ids)
      # @students = @students.joins(:levels, :LevelsStudent).where(levels: params[:level_name]).paginate(:page => params[:page], :per_page => 10)
      @lids = @levels.collect(&:id)
      if @students.nil?
      else
        @ids = @students.collect(&:id)
      end
      student_ids = @student.collect(&:id)
      if @ids.present? || student_ids.present?
        arr = @ids & student_ids
      elsif @ids.present?
        arr = @ids
      elsif student_ids.present?
        arr = student_ids
      end
      if full_query.present? && !(full_query1 == [""])
        if arr.nil?
          @students = nil
        else
          @students = Student.where(id:arr)
        end
      end
    else
    end
  end

end
