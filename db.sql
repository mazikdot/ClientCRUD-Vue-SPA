CREATE DATABASE crudvuecomponent CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE TABLE tbprefix(
	prefix_id int(1) PRIMARY KEY AUTO_INCREMENT NOT NULL,
    pre_th_name varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci
)CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE TABLE users(
	user_username varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci PRIMARY KEY NOT NULL,
    user_password varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
      user_firstname varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
       user_lastname varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
    prefix_id int(1) NOT NULL,
    FOREIGN KEY (prefix_id) REFERENCES tbprefix(prefix_id) ON UPDATE CASCADE
)CHARACTER SET utf8 COLLATE utf8_general_ci;
