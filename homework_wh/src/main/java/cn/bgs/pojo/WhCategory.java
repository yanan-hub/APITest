package cn.bgs.pojo;


public class WhCategory {

  private Integer id;
  private String name;
  private Integer pid;
  private String type;

  private String code;
  private  boolean isParent;

  public Integer getId() {
    return id;
  }

  public void setId(Integer id) {
    this.id = id;
  }

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public Integer getPid() {
    return pid;
  }

  public void setPid(Integer pid) {
    this.pid = pid;
  }

  public String getType() {
    return type;
  }

  public void setType(String type) {
    this.type = type;
  }

  public String getCode() {
    return code;
  }

  public void setCode(String code) {
    this.code = code;
  }

  public boolean getIsParent() {
    return isParent;
  }

  public void setIsParent(boolean isParent) {
    this.isParent = isParent;
  }
  @Override
  public String toString() {
    return "WhCategory{" +
            "id=" + id +
            ", name='" + name + '\'' +
            ", pid=" + pid +
            ", type='" + type + '\'' +
            ", code='" + code + '\'' +
            ", isParent=" + isParent +
            '}';
  }
}
