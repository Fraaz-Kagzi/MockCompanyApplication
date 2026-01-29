Rails.application.routes.draw do
  resources :users
  resources :jobs

  resources :timesheets do
    resources :time_entries, only: [ :new, :create, :edit, :update, :destroy ]
  end

  # Optional: pick a homepage
  root "timesheets#index"
end
