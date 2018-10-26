module LevelsHelper

  # Filter dropdowns
  def level_filter
    [
      ['Contains','contain'],
      ['Equals','equals'],
      ['Starts with','start_with'],
      ['Ends with','end_with']
    ]

  end

  # Batch action method
  def level_batch_action
    [
      ['Batch Action',''],
      ['Delete','delete_selected'],
      ['Email Parent Selected','Email_parent'],

    ]
  end

  # Filter method
  def filter_level_list
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
      if count > 0 && params[:description].present?
        if params[:q][:description_contains] == "contain"
          query += " AND description like ? "
          query_array << "%#{params[:description]}%"
        elsif params[:q][:description_contains] == "equals"
          query += " AND description = ? "
          query_array << params[:description]
        elsif params[:q][:description_contains] == "start_with"
          query += " AND description like ? "
          query_array << "#{params[:description]}%"
        elsif params[:q][:description_contains] == "end_with"
          query += " AND description like ? "
          query_array << "%#{params[:description]}"
        end
      elsif params[:description].present?
        if params[:q][:description_contains] == "contain"
          query += " description like ? "
          query_array << "%#{params[:description]}%"
        elsif params[:q][:description_contains] == "equals"
          query += " description = ? "
          query_array << params[:description]
        elsif params[:q][:description_contains] == "start_with"
          query += " description like ? "
          query_array << "#{params[:description]}%"
        elsif params[:q][:description_contains] == "end_with"
          query += " description like ? "
          query_array << "%#{params[:description]}"
        end
      end
      if count > 0 && params[:classroom_type].present?
        query += " AND classroom_type = ? "
        query_array << params[:classroom_type]
      elsif params[:classroom_type].present?
        query += " classroom_type = ? "
        query_array << params[:classroom_type]
      end
      full_query = query_array.unshift(query)
      @levels = Level.where(full_query)
      @ids = @levels.collect(&:id)
      if full_query == [""]
        return @levels
      end
    else
    end
  end

end


