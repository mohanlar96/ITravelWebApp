package itravel.model;

public class Address {

	private String state, city, street1, street2, zipCode;

	public String getState() { return state; }
	public void setState(String state) {
		this.state = state;
	}

	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}

	public String getStreet1() {
		return street1;
	}
	public void setStreet1(String street1) {
		this.street1 = street1;
	}

	public String getStreet2() {
		return street2;
	}
	public void setStreet2(String street2) {
		this.street2 = street2;
	}

	public String getZipCode() {
		return zipCode;
	}
	public void setZipCode(String zipCode) {
		this.zipCode = zipCode;
	}

    @Override
    public String toString() {
        return "Address{" +
                "state='" + state + '\'' +
                ", city='" + city + '\'' +
                ", street1='" + street1 + '\'' +
                ", street2='" + street2 + '\'' +
                ", zipCode='" + zipCode + '\'' +
                '}';
    }
}
