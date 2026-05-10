
CREATE TABLE Users_SivaCH (
    ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255),
    email VARCHAR(255) NOT NULL,
    location TEXT,
    user_type ENUM('client', 'freelancer') NOT NULL,
    freelance_hourly_rate DECIMAL(10,2)
);

CREATE TABLE Projects_SivaCH (
    ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    skills TEXT,
    location TEXT,
    level_of_expertise TEXT,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_bid_amount DECIMAL(10,2) NOT NULL,
    client_id INT NOT NULL,
    FOREIGN KEY (client_id) REFERENCES Users_SivaCH(ID)
);

CREATE TABLE Bids_SivaCH (
    ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    bid_amount DECIMAL(10,2) NOT NULL,
    estimated_days INT NOT NULL,
    freelancer_id INT NOT NULL,
    project_id INT NOT NULL,
    FOREIGN KEY (freelancer_id) REFERENCES Users_SivaCH(ID),
    FOREIGN KEY (project_id) REFERENCES Projects_SivaCH(ID)
);

CREATE TABLE Reviews_SivaCH (
    ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    comments TEXT,
    rating INT NOT NULL,
    client_id INT NOT NULL,
    freelancer_id INT NOT NULL,
    project_id INT NOT NULL,
    FOREIGN KEY (client_id) REFERENCES Users_SivaCH(ID),
    FOREIGN KEY (freelancer_id) REFERENCES Users_SivaCH(ID),
    FOREIGN KEY (project_id) REFERENCES Projects_SivaCH(ID)
);



