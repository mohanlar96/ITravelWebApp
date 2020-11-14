package itravel.model;

public class Address {
	private String Country, State, City, Street, ZipCode;	

	public String getCountry() {
		return Country;
	}

	public Address setCountry(String country) {
		Country = country;


		return new Address();
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
	
	

}
