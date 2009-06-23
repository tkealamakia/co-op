/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.atomyk.wardcoop

/**
 *
 * @author tdk
 */
class PersonHelper {
    static Person getCurrentUser(authenticateService) {
        def user = authenticateService.principal() 
        def email = user?.getUsername()
        Person.findByEmail(email)
    }
}

