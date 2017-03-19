package ua.nure.model;

public class Discount {

	private String id;
	private Integer step;
	private Integer percent;
	private String userId;

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public Integer getStep() {
		return step;
	}

	public void setStep(Integer step) {
		this.step = step;
	}

	public Integer getPercent() {
		return percent;
	}

	public void setPercent(Integer percent) {
		this.percent = percent;
	}

	@Override
	public String toString() {
		return "Discount{" +
				"id='" + id + '\'' +
				", step=" + step +
				", percent=" + percent +
				'}';
	}
}
