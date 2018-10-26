module TypesHelper

  def payment_terms
    [
      ['Monthly', 'monthly'],
      ['Quarterly','quarterly'],
      ['Half-Yearly','half-yearly'],
      ['Yearly','yearly']
    ]
  end

  # For filter type name
  def type_name
    [
      ['Contains','contain'],
      ['Equals','equals'],
      ['Starts with','start_with'],
      ['Ends with','end_with']
    ]

  end

  # For fee filter and students count
  def fee_filter
    [
      ['Equal','equal'],
      ['Greater than','greater_than'],
      ['Less than','less_than']
    ]

  end

  # Filter method
  def type_filter
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
      if count > 0 && params[:fee].present?
        if params[:q][:fee_contains] == "equal"
          query += " AND fee = ? "
          query_array << params[:fee]
        elsif params[:q][:fee_contains] == "greater_than"
          query += " AND fee > ? "
          query_array << params[:fee]
        elsif params[:q][:fee_contains] == "less_than"
          query += " AND fee < ? "
          query_array << params[:fee]
        end
      elsif params[:fee].present?
        if params[:q][:fee_contains] == "equal"
          query += " fee = ? "
          query_array << params[:fee]
        elsif params[:q][:fee_contains] == "greater_than"
          query += " fee > ? "
          query_array << params[:fee]
        elsif params[:q][:fee_contains] == "less_than"
          query += " fee < ? "
          query_array << params[:fee]
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
      if count > 0 && params[:payment_terms].present?
        query += " AND payment_terms = ? "
        query_array << params[:payment_terms]
      elsif params[:payment_terms].present?
        query += " payment_terms = ? "
        query_array << params[:payment_terms]
      end
      full_query = query_array.unshift(query)
      @types = Type.where(full_query).paginate(:page => params[:page], :per_page => 10)
      @ids = @types.collect(&:id)
      if full_query == [""]
        return @types
      end
    else
    end
  end
end
