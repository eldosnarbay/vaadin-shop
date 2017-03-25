package eshop.vaadin;

import java.io.Serializable;

import eshop.entity.Users;

public class PersonModifiedEvent implements Serializable {

    private final Users person;

    public PersonModifiedEvent(Users p) {
        this.person = p;
    }

    public Users getPerson() {
        return person;
    }
    
}
