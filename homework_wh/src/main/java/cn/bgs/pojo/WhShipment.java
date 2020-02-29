package cn.bgs.pojo;


import java.util.Date;

public class WhShipment {

  private Integer id;
  private Integer uid;
  private Integer cid;
  private String goodsname;
  private Integer number;
  private Date addingTime;
  private String message;
  private String available;

  private WhCategory whCategory;

  @Override
  public String toString() {
    return "WhShipment{" +
            "id=" + id +
            ", uid=" + uid +
            ", cid=" + cid +
            ", goodsname='" + goodsname + '\'' +
            ", number=" + number +
            ", addingTime=" + addingTime +
            ", message='" + message + '\'' +
            ", available='" + available + '\'' +
            ", whCategory=" + whCategory +
            '}';
  }

  public WhCategory getWhCategory() {
    return whCategory;
  }

  public void setWhCategory(WhCategory whCategory) {
    this.whCategory = whCategory;
  }

  public Integer getId() {
    return id;
  }

  public void setId(Integer id) {
    this.id = id;
  }

  public Integer getUid() {
    return uid;
  }

  public void setUid(Integer uid) {
    this.uid = uid;
  }

  public Integer getCid() {
    return cid;
  }

  public void setCid(Integer cid) {
    this.cid = cid;
  }

  public String getGoodsname() {
    return goodsname;
  }

  public void setGoodsname(String goodsname) {
    this.goodsname = goodsname;
  }

  public Integer getNumber() {
    return number;
  }

  public void setNumber(Integer number) {
    this.number = number;
  }

  public Date getAddingTime() {
    return addingTime;
  }

  public void setAddingTime(Date addingTime) {
    this.addingTime = addingTime;
  }

  public String getMessage() {
    return message;
  }

  public void setMessage(String message) {
    this.message = message;
  }

  public String getAvailable() {
    return available;
  }

  public void setAvailable(String available) {
    this.available = available;
  }

}
