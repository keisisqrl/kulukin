Kulukin.Repo.delete_all Kulukin.User

Kulukin.User.changeset(%Kulukin.User{},
  %{
    name: "Default Admin",
    email: "admin@example.com",
    password: "opensesame",
    password_confirmation: "opensesame",
    admin: true
  })
|> Kulukin.Repo.insert!
|> Coherence.ControllerHelpers.confirm!
