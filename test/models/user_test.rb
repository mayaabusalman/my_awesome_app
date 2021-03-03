require "test_helper"

class UserTest < ActiveSupport::TestCase
  setup do
    @user = User.create({
      first_name: 'Rami',
      last_name: 'Rizk',
      email: 'rami@gtlogic.com'
      role: 'member'
    })
  end

  test 'getting the full name' do
    assert_equal 'Rami Rizk', @user.full_name
  end

  test 'setting the full name' do
    @user.full_name = 'Teddy Zeenny'
    assert_equal 'Teddy', @user.first_name
    assert_equal 'Zeenny', @user.last_name
  end

  test 'first name validation' do
    assert @user.valid?
    @user.first_name = nil
    assert @user.invalid?
    assert_equal @user.errors[:first_name].length, 1
    assert @user.errors[:first_name].include?("can't be blank")
  end

  test 'last name validation' do
    assert @user.valid?
    @user.last_name = nil
    assert @user.invalid?
    assert_equal @user.errors[:last_name].length, 1
    assert @user.errors[:last_name].include?("can't be blank")
  end

  test 'email validation' do
    assert @user.valid?
    @user.email = 'rami@gtlogic.com'
    assert @user.invalid?
    assert_equal @user.errors[:email].length, 1
    assert @user.errors[:email].include?("taken")
    @user.email = nil
    assert @user.invalid?
    assert_equal @user.errors[:email].length, 1
    assert @user.errors[:email].include?("can't be blank")
    @user.email = 'rami'
    assert @user.invalid?
    assert_equal @user.errors[:email].length, 1
    assert @user.errors[:email].include?("invalid")
  end

  test 'role options validation' do
    assert @user.valid?
    @user.role = 'member'
    assert @user.valid?
    @user.role = 'admin'
    assert @user.valid?
    @user.role = 'guest'
    assert @user.invalid?
    # @user.role = !'member' && !'admin'
    # assert @user.invalid?
  end
end
