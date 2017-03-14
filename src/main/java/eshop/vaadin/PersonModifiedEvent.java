package eshop.vaadin;

import java.io.Serializable;

import eshop.entity.Person;

public class PersonModifiedEvent implements Serializable {

    private final Person person;

    public PersonModifiedEvent(Person p) {
        this.person = p;
    }

    public Person getPerson() {
        return person;
    }
    
}
