package com.atomyk.wardcoop

/**
 * User domain class.
 */
class Person {
	static transients = ['pass']
	static hasMany = [authorities: Authority, posts: Post]
	static belongsTo = [ward:Ward]
	
	String firstName
	String lastName
	/** MD5 Password */
	String passwd
	/** enabled */
	boolean enabled
	String email
	String telephone


	/** plain password to create a MD5 password */
	String pass = '[secret]'

	static constraints = {
		email(blank: false, email:true, unique:true)
		firstName(blank: false)
		lastName(blank: false)
		passwd(blank: false, minLength:6)
		enabled()
	}
}
