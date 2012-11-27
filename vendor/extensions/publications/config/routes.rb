Refinery::Core::Engine.routes.append do

  # Frontend routes
  namespace :publications do
    resources :publications, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :publications, :path => '' do
    namespace :admin, :path => 'refinery' do
      resources :publications, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
