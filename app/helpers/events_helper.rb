module EventsHelper

  # For filter dropdowns
  def event_filter_name
    [
      ['Contains','contain'],
      ['Equals','equals'],
      ['Starts with','start_with'],
      ['Ends with','end_with']
    ]

  end

  # filter
  def event_filter
    if params[:q].present?
      count = 0
      query_array = []
      query = ""
      if params[:key_event_id].present?
        count = count + 1
        query += " key_event_id = ? "
        query_array << params[:key_event_id]
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

      if count> 0 && params[:start_date][:start_date].present? && params[:start_date][:end_date].present?
        query += " AND start_date BETWEEN ? AND ? "
        query_array << params[:start_date][:start_date]
        query_array << params[:start_date][:end_date]
      elsif params[:start_date][:start_date].present? && params[:start_date][:end_date].present?
        query += " start_date BETWEEN ? AND ? "
        query_array << params[:start_date][:start_date]
        query_array << params[:start_date][:end_date]
      end
      if count > 0 && params[:end_date][:start_date].present? && params[:end_date][:end_date].present?
        query += "AND end_date BETWEEN ? AND ? "
        query_array << params[:end_date][:start_date]
        query_array << params[:end_date][:end_date]
      elsif params[:end_date][:start_date].present? && params[:end_date][:end_date].present?
        query += " end_date BETWEEN ? AND ? "
        query_array << params[:end_date][:start_date]
        query_array << params[:end_date][:end_date]
      end

      full_query = query_array.unshift(query)
      @events = Event.where(full_query)
      @ids = @events.collect(&:id)
      if full_query == [""]
        return @events
      end
    else
    end
  end

end
