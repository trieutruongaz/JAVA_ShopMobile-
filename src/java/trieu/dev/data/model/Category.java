package trieu.dev.data.model;

public class Category {
	public int id;
	public String name;
	private String thumbnail;
        private String image; // Add this line

	// insert vào
	public Category(String name, String thumbnail) {
		super();
		this.name = name;
		this.thumbnail = thumbnail;
	}

	public Category(int id, String name, String thumbnail) {
		super();
		this.id = id;
		this.name = name;
		this.thumbnail = thumbnail;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getThumbnail() {
		return thumbnail;
	}

	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}
         // Getters and setters
        public String getImage() {
            return image;
        }

        public void setImage(String image) {
            this.image = image;
        }
            

        // Other properties, constructors, etc.
}
