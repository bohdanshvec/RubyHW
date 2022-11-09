module Requests

  private

    def handle_auth_request
      # convert request body string ruby hash
      # body = { email: 'abc@mail.com', password: 'password' }
      # body[:email]
    end

    def handle_post_requests
      if @req.path.include?('name')
        @name = @req.body.read.split('=')[1] # get value from fname
        
        if @name.nil?
          [302, {'location' => 'http://localhost:9292/name'}, []]
        else
          [302, {'location' => 'http://localhost:9292'}, []]
        end
      elsif @req.path.include?('auth')
        # read cookie from req
        # auth user with password and email - generate in initializer with hardcoded values
        # create new response with cookie
      else
        [302, {'location' => 'http://localhost:9292'}, []]
      end
    end

    def handle_get_requests
      if @req.path.include?('1')
        [200, {}, [template_start(battle_with_dragon, battle_links)]]
      elsif @req.path.include?('2')
        [200, {}, [template_start("2222222222222")]]
      elsif @req.path.include?('3')
        [200, {}, [template_start("3333333333333")]]
      elsif @req.path.include?('4')
        [200, {}, [template_start("4444444444444")]]
      elsif @req.path.include?('5')
        @satiety = go_eat(@satiety)
        [200, {}, [template_start(go_eat_page, regulations_battle_link)]]
      elsif @req.path.include?('6')
        [200, {}, [template_start(total_time, regulations_battle_link)]]
      elsif @req.path.include?('7')
        [200, {}, [template_start(regulations_battle, regulations_battle_link)]]
      elsif @req.path.include?('8') || @req.path.include?('name')
        [200, {}, [forma_html]]
      elsif @req.path.include?('9')
        [200, {}, [exit_gem]]
      elsif @req.path.include?('battle')
        if @req.params['step'] == "2"
          @health = Battle.new(@health).start
          [200, {}, [template_start(battle_with_dragon, battle_links)]]
        elsif
          @req.params['step'] == "3"
          [200, {}, [template_start(regulations_battle, regulations_battle_link)]]
        else
          handle_default_requests
        end
      else
        handle_default_requests
      end
    end

    def handle_default_requests
      [200, {}, [template_start(menu)]]
    end

end