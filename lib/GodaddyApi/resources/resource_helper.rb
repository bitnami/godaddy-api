module GodaddyApi
  module ResourceHelper
    # list all items using the list action and pagination
    def all limit: 100
      rc = []
      offset = 0
      while true
        result = list(offset: offset, limit: limit)
        rc += result
        break if result.size < limit
        offset += limit
      end
      rc
    end
  end
end
