package itravel.model;

public class Address {
    private String Country, State, City, Street, ZipCode;

    public String getCountry() {
        return Country;
    }

    public void setCountry(String country) {
        Country = country;
    }

    public String getState() {
        return State;
    }

    public void setState(String state) {
        State = state;
    }

    public String getCity() {
        return City;
    }

    public void setCity(String city) {
        City = city;
    }

    public String getStreet() {
        return Street;
    }

    public void setStreet(String street) {
        Street = street;
    }

    public String getZipCode() {
        return ZipCode;
    }

    public void setZipCode(String zipCode) {
        ZipCode = zipCode;
    }

    @Override
    public String toString() {
        return "Address{" +
                "Country='" + Country + '\'' +
                ", State='" + State + '\'' +
                ", City='" + City + '\'' +
                ", Street='" + Street + '\'' +
                ", ZipCode='" + ZipCode + '\'' +
                '}';
    }
}