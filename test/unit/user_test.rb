require 'test_helper'

class UserTest < ActiveSupport::TestCase

  test "user dn must pass these conditions" do
    dn = users(:dn)
    
    assert dn.regular?, "dn is regular"
    assert !dn.admin?, "dn is not admin"
    assert dn.activated?, "dn is activated"
    assert !dn.new?, "dn is not new"
    assert !dn.deactivated?, "dn is not deactivated"
    assert !dn.suspended?, "dn is not suspended"
  end
  
  test "user ln must pass these conditions" do
    ln = users(:ln)
    
    assert ln.admin?, "ln is admin"
    assert !ln.regular?, "ln is not regular"
    assert ln.activated?, "ln is activated"
    assert !ln.new?, "ln is not new"
    assert !ln.deactivated?, "ln is not deactivated"
    assert !ln.suspended?, "ln is not suspended" 
  end

  test "change the status of user dn" do
    dn = users(:dn)
    
    assert dn.deactivate, "successfully deactivate dn"
    assert dn.deactivated?, "dn is deactivated"
    assert dn.suspend, "successfully suspend dn"
    assert dn.suspended?, "dn is suspended"
    assert dn.activate, "successfully activate dn"
    assert dn.activated?, "dn is activated"
  end
  
  test "change the role(s) of user dn" do
    dn = users(:dn)
    
    assert dn.have_no_role?, "dn has no role (regular)"
    assert !dn.have_role?(:admin), "dn is not admin"
    assert !dn.have_roles?([:admin, :bogus_role]), "dn has none of these roles"
    assert dn.overwrite_roles([:admin]), "successfully promte dn to admin"
    assert dn.admin?, "dn is admin"
    assert dn.remove_roles([:admin]), "successfully demote dn down to regular"
    assert dn.have_no_role?, "dn has no role (regular)"
    assert dn.add_roles([:admin, :bogus_role]), "successfully promte dn to admin"
    assert dn.admin?, "dn is admin"
    assert dn.role == User::Role[:admin], "dn has only admin role"
  end

end
