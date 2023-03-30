json.user do
    json.extract! @user, :id, :email, :username, :created_at, :updated_at
    json.set! :reviews, @user.reviews
    json.set! :benches_reviewed, @user.benches_reviewed
end