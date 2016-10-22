package beans;

public class Shelter 
{
	private int ID;
	private String comments;
	private String name;
	private String cocNumber;
	
	private String Inclusion;
	private int totalBeds;
	private int availableBeds;
	private double lat;
	private double lon;
	private String city;
	private String state;
	private int zip;
	private String address;	
	
	public Shelter()
	{
		this.ID=0;
		this.cocNumber="MO-500";
		this.Inclusion="Everyone";
		this.comments="no comments";
		this.name="default name";
		this.totalBeds=0;
		this.availableBeds=0;
		this.lat=0;
		this.lon=0;
		this.city="";
		this.state="";
		this.zip=0;
		this.address="";
	}
	
	public int getID() {
		return ID;
	}
	public void setID(int iD) {
		ID = iD;
	}
	
	public String getComments() {
		return comments;
	}
	public void setComments(String comments) {
		this.comments = comments;
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	public String getCocNumber() {
		return cocNumber;
	}

	public void setCocNumber(String cocNumber) {
		this.cocNumber = cocNumber;
	}

	public String getInclusion() {
		return Inclusion;
	}

	public void setInclusion(String inclusion) {
		Inclusion = inclusion;
	}
	public int getTotalBeds() {
		return totalBeds;
	}
	public void setTotalBeds(int totalBeds) {
		this.totalBeds = totalBeds;
	}
	
	public void addTotalBeds(int newBeds)
	{
		this.totalBeds+=newBeds;
		this.availableBeds+=newBeds;
	}
	public void removeTotalBeds(int removedBeds)
	{
		int bedDifference=totalBeds-availableBeds;
		if (bedDifference<removedBeds)
		{
			removedBeds-=bedDifference;
			this.totalBeds-=removedBeds;
			this.availableBeds=totalBeds;
			
		}
		else
		{
			this.totalBeds-=removedBeds;
		}
	}
	
	public int getAvailableBeds() {
		return availableBeds;
	}
	public void setAvailableBeds(int availableBeds) {
		this.availableBeds = availableBeds;
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
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public int getZip() {
		return zip;
	}
	public void setZip(int zip) {
		this.zip = zip;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}

}
