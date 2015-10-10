require 'spec_helper'

describe "User" do
  it "has a valid factory" do
    build(:user).should be_valid
  end

  it "has a present first name" do
    build(:user, first_name: "    ").should_not be_valid
  end
  
  it "has a present last name" do
    build(:user, last_name: "    ").should_not be_valid
  end

  it "first_name has most 50 characters" do
    long_name = "a" * 51
    build(:user, first_name: long_name).should_not be_valid
    shorter_name = "a" * 50
    build(:user, first_name: shorter_name).should be_valid
  end

  it "last_name has most 50 characters" do
    longer_name = "b" * 51
    build(:user, last_name: longer_name).should_not be_valid
    shorter_name = "b" * 50
    build(:user, last_name: shorter_name).should be_valid
  end
  
  it "email has most 255 characters" do
    longer_mail = "m" * 252 + "@a.c"
    build(:user, email: longer_mail).should_not be_valid
    shorter_mail = "m" * 251 + "@a.c"
    build(:user, email: shorter_mail).should be_valid
  end

  it "email format should be correct" do
    build(:user, email: "fe.ffwe@e").should_not be_valid
    build(:user, email: "@greger.com").should_not be_valid
    build(:user, email: "a@c.q").should be_valid
    build(:user, email: "   ").should_not be_valid
    build(:user, email: "gerge").should_not be_valid
  end

  it "email should be unique" do
    user1 = build(:user, email: "aer.cgr@gerg.com")
    user2 = user1.dup
    user2.email = user1.email.upcase
    user1.save
    user2.should_not be_valid
  end

end
