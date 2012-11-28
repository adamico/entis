Refinery::Core::Engine.routes.append do

  # Frontend routes
  namespace :centers do
    resources :centers, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :centers, :path => '' do
    namespace :admin, :path => 'refinery' do
      resources :centers, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end


  # Frontend routes
  namespace :states do
    resources :states, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :states, :path => '' do
    namespace :admin, :path => 'refinery' do
      resources :states, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
