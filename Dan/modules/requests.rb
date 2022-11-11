require 'erb'

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
        [200, {}, [template_start("Данный функционал не подключён.", menu_link)]]
      elsif @req.path.include?('3')
        health_up
        satiety_down
        @life < 1 ? [200, {}, [game_end]] : [200, {}, [template_start(do_sleep_page, menu_link)]]
      elsif @req.path.include?('4')
        level_up if @health < 100
        health_up
        satiety_down
        menu
        @life < 1 ? [200, {}, [game_end]] : [200, {}, [template_start(do_sport_page, menu_link)]]
      elsif @req.path.include?('5')
        go_eat
        [200, {}, [template_start(go_eat_page, menu_link)]]
      elsif @req.path.include?('6')
        [200, {}, [template_start(total_time, menu_link)]]
      elsif @req.path.include?('7')
        [200, {}, [template_start(regulations_game, menu_link)]]
      elsif @req.path.include?('8') || @req.path.include?('name')
        [200, {}, [forma_html]]
      elsif @req.path.include?('9')
        [200, {}, [game_end]]
      elsif @req.path.include?('battle')
        if @req.params['step'] == "2"
          health_down
          level_up
          satiety_down
          @life < 1 ? [200, {}, [game_end]] : [200, {}, [template_start(battle_with_dragon, battle_links)]]
        elsif
          @req.params['step'] == "3"
          [200, {}, [template_start(regulations_game, menu_link)]]
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

    # def render(template)
    #   path = File.expand_path("../views/#{template}", __FILE__)
    #   ERB.new(File.read(path)).result(binding)
    # end

end