Rails.application.routes.draw do
  get 'posts/index'

  get 'posts/new'

  get 'posts/create'

  get 'posts/update'

  get 'posts/edit'

  get 'posts/destroy'

  get 'topics/index'

  get 'topics/new'

  get 'topics/create'

  get 'topics/update'

  get 'topics/edit'

  get 'topics/destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
