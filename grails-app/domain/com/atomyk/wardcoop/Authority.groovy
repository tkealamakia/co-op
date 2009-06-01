package com.atomyk.wardcoop

/**
 * Authority domain class.
 */
class Authority {

	static hasMany = [people: Person]
	static belongsTo = Person

	/** description */
	String description
	/** ROLE String */
	String authority
	

	static constraints = {
		authority(blank: false, unique: true)
		description()
	}
}
