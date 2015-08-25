class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  # Repeating self too much for Omniauth Callbacks.
  # Refactor because this is horrible
  def twitter
    auth_hash = request.env['omniauth.auth']
    uid = auth_hash['uid']
    name = auth_hash['info']['name']
    auth = Authorization.find_by_provider_and_uid('twitter', uid)

    if auth
      user = auth.user
    else
      unless current_user
        unless user = User.find_by_name(name)
          user = User.create({
                               name: name,
                               password: Devise.friendly_token[0,8],
                               email: "#{UUIDTools::UUID.random_create}@tickerTracker"
          })
        end
      else
        user = current_user
      end
      unless auth = user.authorizations.find_by_provider('twitter')
        auth = user.authorizations.build(provider: 'twitter', uid: uid)
        user.authorizations << auth
      end
      auth.update_attributes({
                               uid: uid,
                               token: auth_hash['credentials']['token'],
                               secret: auth_hash['credentials']['secret'],
                               name: name,
                               url: "http://twitter.com/#{name}"
      })
    end
    if user
      sign_in_and_redirect user, :event => :authentication
    else
      redirect_to :new_user_registration
    end
  end

  # def facebook
  #   @user = User.from_omniauth(request.env['omniauth.auth'])
  #   sign_in_and_redirect @user
  # end

  def facebook
    auth_hash = request.env['omniauth.auth']
    uid = auth_hash['uid']
    name = auth_hash['info']['name']
    auth = Authorization.find_by_provider_and_uid('facebook', uid)

    if auth
      user = auth.user
    else
      unless current_user
        unless user = User.find_by_name(name)
          user = User.create({
                               name: name,
                               password: Devise.friendly_token[0,20],
                               email: "#{UUIDTools::UUID.random_create}@tickerTracker"
          })
        end
      else
        user = current_user
      end
      unless auth = user.authorizations.find_by_provider('facebook')
        auth = user.authorizations.build(provider: 'facebook', uid: uid)
        user.authorizations << auth
      end
      auth.update_attributes({
                               uid: uid,
                               token: auth_hash['credentials']['token'],
                               secret: auth_hash['credentials']['secret'],
                               name: name,
                               url: "http://facebook.com/#{name}"
      })
    end
    if user
      sign_in_and_redirect user, :event => :authentication
    else
      redirect_to :new_user_registration
    end
  end
end
