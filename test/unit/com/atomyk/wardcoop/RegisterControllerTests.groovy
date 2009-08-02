package com.atomyk.wardcoop

import grails.test.*

class RegisterControllerTests extends ControllerUnitTestCase {
    protected void setUp() {
        super.setUp()
    }

    protected void tearDown() {
        super.tearDown()
    }

    void testSave() {
        mockRequest.method = 'POST'
        mockDomain(Person)
        mockService(AuthenticateService)

		def authService = mockFor(AuthenticateService)
		//otherControl.demand.newIdentifier(1..1) {-> return testId }


        mockParams.email = "tkealamakia@gmail.com"
        mockParams.firstName = "Tom"
        mockParams.lastName = "Kealamakia"
        mockParams.passwd = "asdfg"
        mockParams.repasswd = "asdfg"
        mockParams.telephone = "888-888-8888"
        mockParams.captch = "ASDFG"

        controller.save()
        assertEquals '/', redirectArgs.uri

    }
}
