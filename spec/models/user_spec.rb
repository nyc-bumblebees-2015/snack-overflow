require 'rails_helper'

describe User do
  it "is valid with a username, email and password" do
    user = User.new(
      username: 'jguzik',
      email: 'jguzik@gmail.com',
      password: 'banana')
    expect(user).to be_valid
  end

  it "is invalid without a username" do
    user = User.new(username: nil)
    user.valid?
    expect(user.errors[:username]).to include("can't be blank")
  end

  it "is invalid without an email" do
    user = User.new(email: nil)
    user.valid?
    expect(user.errors[:email]).to include("can't be blank")
  end

  it "is invalid without a password" do
    user = User.new(password: nil)
    user.valid?
    expect(user.errors[:password]).to include("can't be blank")
  end

  it "is invalid with a duplicate username" do
    User.create(
      username: 'Joe', email: 'tester@gmail.com',
      password: 'banana'
    )
    user = User.new(
      username: 'Joe', email: 'tester2@gmail.com',
      password: 'banana'
    )
    user.valid?
    expect(user.errors[:username]).to include("has already been taken")
  end

  it "is invalid with a duplicate email address" do
    User.create(
      username: 'Joe', email: 'tester@gmail.com',
      password: 'banana'
    )
    user = User.new(
      username: 'Joey', email: 'tester@gmail.com',
      password: 'banana'
    )
    user.valid?
    expect(user.errors[:email]).to include("has already been taken")
  end

end