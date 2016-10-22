package beans;

public class Client {
	
	private int id;
	private int requestedShelterID;
	private String firstName;
	private String lastName;
	private double lat;
	private double lon;
	private String phoneNumber;
	private int eta;
	private int beds;
	private int age;
	private String gender;
	private boolean pending;
	
	public Client()
	{
		id=0;
		requestedShelterID=0;
		firstName="";
		lastName="";
		lat=0;
		lon=0;
		phoneNumber="";
		eta=0;
		beds=0;
		age=0;
		gender="";
		pending=true;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getRequestedShelterID() {
		return requestedShelterID;
	}
	public void setRequestedShelterID(int requestedShelterID) {
		this.requestedShelterID = requestedShelterID;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public double getLat() {
		return lat;
	}
	public void setLat(double lat) {
		this.lat = lat;
	}
	public double getLon() {
		return lon;
	}
	public void setLon(double lon) {
		this.lon = lon;
	}
	public String getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	public int getEta() {
		return eta;
	}
	public void setEta(int eta) {
		this.eta = eta;
	}
	public int getBeds() {
		return beds;
	}
	public void setBeds(int beds) {
		this.beds = beds;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public boolean isPending() {
		return pending;
	}
	public void setPending(boolean pending) {
		this.pending = pending;
	}
}
