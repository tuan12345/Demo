
package entity;

public class UserSignup {
    private int userID;
    private String userName;
    private String password;
    private String phone;
    private String email;
    private String address;
    private boolean gender;
    private String birthday;
    private String userType;
    private int groupID;

    public UserSignup() {
    }

    public UserSignup(int userID, String userName, String password, String phone, String email, String address, boolean gender, String birthday, String userType, int groupID) {
        this.userID = userID;
        this.userName = userName;
        this.password = password;
        this.phone = phone;
        this.email = email;
        this.address = address;
        this.gender = gender;
        this.birthday = birthday;
        this.userType = userType;
        this.groupID = groupID;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public boolean isGender() {
        return gender;
    }

    public void setGender(boolean gender) {
        this.gender = gender;
    }

    public String getBirthday() {
        return birthday;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }

    public String getUserType() {
        return userType;
    }

    public void setUserType(String userType) {
        this.userType = userType;
    }

    public int getGroupID() {
        return groupID;
    }

    public void setGroupID(int groupID) {
        this.groupID = groupID;
    }
    
    
}
