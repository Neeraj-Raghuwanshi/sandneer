module ParentsHelper

  # for filter dropdown
  def filter_name
    [
      ['Contains','contain'],
      ['Equals','equals'],
      ['Starts with','start_with'],
      ['Ends with','end_with']
    ]

  end

  # Batch actions method
  def batch_action_name
    [
      ['Batch Action',''],
      ['Email Selected','email_send'],
      ['Sms Selected','sms_send'],
      ['Give Permission','give_permission'],
      ['Delete Selected','delete_selected']
    ]
  end

  # For students count
  def students_count_filter
    [
      ['Equal','equal'],
      ['Greater than','greater_than'],
      ['Less than','less_than']
    ]

  end

  # Filter method
  def filter_parent
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
      if count > 0 && params[:mobile].present?
        if params[:q][:mobile_contains] == "contain"
          if Parent.check_string(params[:mobile])
            query += " AND mobile like ? "
            query_array << "%#{params[:mobile]}%"
          end
        elsif params[:q][:mobile_contains] == "equals"
          if Parent.check_string(params[:mobile])
            query += " AND mobile = ? "
            query_array << params[:mobile]
          end
        elsif params[:q][:mobile_contains] == "start_with"
          if Parent.check_string(params[:mobile])
            query += " AND mobile like ? "
            query_array << "#{params[:mobile]}%"
          end
        elsif params[:q][:mobile_contains] == "end_with"
          if Parent.check_string(params[:mobile])
            query += " AND mobile like ? "
            query_array << "%#{params[:mobile]}"
          end
        end
      elsif params[:mobile].present?
        if params[:q][:mobile_contains] == "contain"
          if Parent.check_string(params[:mobile])
            query += " mobile like ? "
            query_array << "%#{params[:mobile]}%"
          end
        elsif params[:q][:mobile_contains] == "equals"
          if Parent.check_string(params[:mobile])
            query += " mobile = ? "
            query_array << params[:mobile]
          end
        elsif params[:q][:mobile_contains] == "start_with"
          if Parent.check_string(params[:mobile])
            query += " mobile like ? "
            query_array << "#{params[:mobile]}%"
          end
        elsif params[:q][:mobile_contains] == "end_with"
          if Parent.check_string(params[:mobile])
            query += " mobile like ? "
            query_array << "%#{params[:mobile]}"
          end
        end
      end
      if count > 0 && params[:postcode].present?
        if params[:q][:postcode_contains] == "contain"
          if Parent.check_string(params[:mobile])
            query += " AND postcode like ? "
            query_array << "%#{params[:postcode]}%"
          end
        elsif params[:q][:postcode_contains] == "equals"
          if Parent.check_string(params[:postcode])
            query += " AND postcode = ? "
            query_array << params[:postcode]
          end
        elsif params[:q][:postcode_contains] == "start_with"
          if Parent.check_string(params[:postcode])
            query += " AND postcode like ? "
            query_array << "#{params[:postcode]}%"
          end
        elsif params[:q][:postcode_contains] == "end_with"
          if Parent.check_string(params[:postcode])
            query += " AND postcode like ? "
            query_array << "%#{params[:postcode]}"
          end
        end
      elsif params[:postcode].present?
        if params[:q][:postcode_contains] == "contain"
          if Parent.check_string(params[:mobile])
            query += " postcode like ? "
            query_array << "%#{params[:postcode]}%"
          end
        elsif params[:q][:postcode_contains] == "equals"
          if Parent.check_string(params[:postcode])
            query += " postcode = ? "
            query_array << params[:postcode]
          end
        elsif params[:q][:postcode_contains] == "start_with"
          if Parent.check_string(params[:postcode])
            query += " postcode like ? "
            query_array << "#{params[:postcode]}%"
          end
        elsif params[:q][:postcode_contains] == "end_with"
          if Parent.check_string(params[:postcode])
            query += " postcode like ? "
            query_array << "%#{params[:postcode]}"
          end
        end
      end
      if count > 0 && params[:home_phone].present?
        if params[:q][:home_phone_contains] == "contain"
          if Parent.check_string(params[:home_phone])
            query += " AND home_phone like ? "
            query_array << "%#{params[:home_phone]}%"
          end
        elsif params[:q][:home_phone_contains] == "equals"
          if Parent.check_string(params[:home_phone])
            query += " AND home_phone = ? "
            query_array << params[:home_phone]
          end
        elsif params[:q][:home_phone_contains] == "start_with"
          if Parent.check_string(params[:home_phone])
            query += " AND home_phone like ? "
            query_array << "#{params[:home_phone]}%"
          end
        elsif params[:q][:home_phone_contains] == "end_with"
          if Parent.check_string(params[:home_phone])
            query += " AND home_phone like ? "
            query_array << "%#{params[:home_phone]}"
          end
        end
      elsif params[:home_phone].present?
        if params[:q][:home_phone_contains] == "contain"
          if Parent.check_string(params[:home_phone])
            query += " home_phone like ? "
            query_array << "%#{params[:home_phone]}%"
          end
        elsif params[:q][:home_phone_contains] == "equals"
          if Parent.check_string(params[:home_phone])
            query += " home_phone = ? "
            query_array << params[:home_phone]
          end
        elsif params[:q][:home_phone_contains] == "start_with"
          if Parent.check_string(params[:home_phone])
            query += " home_phone like ? "
            query_array << "#{params[:home_phone]}%"
          end
        elsif params[:q][:home_phone_contains] == "end_with"
          if Parent.check_string(params[:home_phone])
            query += " home_phone like ? "
            query_array << "%#{params[:home_phone]}"
          end
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
      if count > 0 && params[:city].present?
        if params[:q][:city_contains] == "contain"
          query += " AND city like ? "
          query_array << "%#{params[:city]}%"
        elsif params[:q][:city_contains] == "equals"
          query += " AND city = ? "
          query_array << params[:city]
        elsif params[:q][:city_contains] == "start_with"
          query += " AND city like ? "
          query_array << "#{params[:city]}%"
        elsif params[:q][:city_contains] == "end_with"
          query += " AND city like ? "
          query_array << "%#{params[:city]}"
        end
      elsif params[:city].present?
        if params[:q][:city_contains] == "contain"
          query += " city like ? "
          query_array << "%#{params[:city]}%"
        elsif params[:q][:city_contains] == "equals"
          query += " city = ? "
          query_array << params[:city]
        elsif params[:q][:city_contains] == "start_with"
          query += " city like ? "
          query_array << "#{params[:city]}%"
        elsif params[:q][:city_contains] == "end_with"
          query += " city like ? "
          query_array << "%#{params[:city]}"
        end
      end
      if count > 0 && params[:students_count].present?
        if params[:q][:students_count_contains] == "equal"
          query += " AND students_count = ? "
          query_array << params[:students_count]
        elsif params[:q][:students_count_contains] == "greater_than"
          query += " AND students_count > ? "
          query_array << params[:students_count]
        elsif params[:q][:students_count_contains] == "less_than"
          query += " AND students_count < ? "
          query_array << params[:students_count]
        end
      elsif params[:students_count].present?
        if params[:q][:students_count_contains] == "equal"
          query += " students_count = ? "
          query_array << params[:students_count]
        elsif params[:q][:students_count_contains] == "greater_than"
          query += " students_count > ? "
          query_array << params[:students_count]
        elsif params[:q][:students_count_contains] == "less_than"
          query += " students_count < ? "
          query_array << params[:students_count]
        end
      end
      full_query = query_array.unshift(query)
      @parents = Parent.where(full_query).paginate(:page => params[:page], :per_page => 10)
      @ids = @parents.collect(&:id)
      if full_query == [""]
        return @parents
      end
    else
    end
  end

end
