CREATE TABLE tiw_users (
    id SERIAL PRIMARY KEY,
    firstname VARCHAR(255) NOT NULL,
    lastname VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    role VARCHAR(255)  NULL,
    created_at TIMESTAMP NOT NULL,
    updated_at TIMESTAMP NOT NULL
);

CREATE TABLE tiw_admin_preferences (
    id SERIAL PRIMARY KEY,
    number_article INT NOT NULL DEFAULT 3
);

CREATE TABLE tiw_article_types (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

INSERT INTO tiw_article_types (name) VALUES ('sports');
INSERT INTO tiw_article_types (name) VALUES ('acteur');
INSERT INTO tiw_article_types (name) VALUES ('politique');

INSERT INTO tiw_admin_preferences (number_article)
VALUES (3);

CREATE TABLE tiw_posts(
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    author VARCHAR(255) NOT NULL,
    content TEXT NOT NULL,
    status VARCHAR(255) NOT NULL,
    category_id INTEGER  NULL
);


ALTER TABLE tiw_users ALTER COLUMN role TYPE INT USING role::integer;
ALTER TABLE tiw_posts ADD COLUMN image_path VARCHAR(255)  NULL;
/* rajoute une colonne slug */

ALTER TABLE tiw_posts ADD COLUMN slug VARCHAR(255)  NULL;
ALTER TABLE tiw_posts ADD COLUMN image VARCHAR(255)  NULL;


/* ALTER TABLE posts DROP COLUMN name;
 */
ALTER TABLE tiw_posts ADD COLUMN date_created TIMESTAMP  NULL DEFAULT CURRENT_TIMESTAMP;


ALTER TABLE tiw_users ADD COLUMN status VARCHAR(255)  NULL;

/* SELECT * FROM users WHERE email = 'audesandrine6@gmail' AND  status IS NULL;
 */
ALTER TABLE tiw_users ADD reset_token VARCHAR(255);

/* ALTER TABLE users ALTER COLUMN password SET VALUES '$2y$10$2YKjHrOKhhG8gPeXxn0X2O3ecxmuT1nDbClzkLIFN5qedDYrE6fwa' WHERE email = 'audesandrine6@gmail.com' ;
 */
/* ALTER TABLE users ADD active_account VARCHAR(255);
 */
 ALTER TABLE tiw_users ADD active_account_token VARCHAR(255);
/*  ALTER TABLE users DROP COLUMN active_account;
 *//* ALTER TABLE users ADD role_id INT
 */
ALTER TABLE tiw_users ADD tokenID VARCHAR(255) DEFAULT NULL;
/* ALTER TABLE users ALTER COLUMN role TYPE INT ;
 *//* les 3 ceux sont les customers 1 pour admin et 2 pour éditeurs */

ALTER TABLE tiw_posts ALTER COLUMN title DROP NOT NULL;

ALTER TABLE tiw_users ADD COLUMN expirate_token TIMESTAMP  NULL;

 CREATE TABLE tiw_articles (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    author VARCHAR(255)  NULL,
    content TEXT NOT NULL,
    created_at TIMESTAMP NOT NULL,
    updated_at TIMESTAMP NOT NULL,
    user_id INTEGER  NULL,
    slug VARCHAR(255) NOT NULL,
    status VARCHAR(255) NOT NULL,
    category_id INTEGER  NULL,
    active_comment VARCHAR(255)  NULL

); 
/* ALTER TABLE tiw_articles ADD COLUMN category_id INTEGER  NULL;
 */
 /* ALTER TABLE articles ADD COLUMN author VARCHAR(255) NOT  NULL;
 *//* ALTER TABLE articles DROP COLUMN user_id;
 */
 CREATE TABLE tiw_comments (
    id SERIAL PRIMARY KEY,
    content TEXT NOT NULL,
    created_at TIMESTAMP NOT NULL,
    updated_at TIMESTAMP NOT NULL,
    user_id INTEGER NOT NULL,
    author VARCHAR(255) NOT NULL,
    article_id INTEGER NOT NULL,
    status VARCHAR(255) NOT NULL
); 
ALTER TABLE tiw_comments ALTER COLUMN author DROP NOT NULL;


CREATE TABLE tiw_menu (
  menu_id SERIAL PRIMARY KEY,
  parent_id INT,
  titre VARCHAR(255),
  url VARCHAR(255),
  status VARCHAR(255) NOT NULL
);

ALTER TABLE tiw_menu ADD COLUMN position INT NULL;



/* ALTER TABLE menu ALTER COLUMN parent_id DROP NOT NULL;
ALTER TABLE menu ADD COLUMN status VARCHAR(255) NULL ; */

CREATE TABLE tiw_history (
    id SERIAL PRIMARY KEY,
    table_name VARCHAR(255) NOT NULL,
    entity_type VARCHAR(255) NOT NULL,
    entity_id INTEGER NOT NULL,
    action VARCHAR(255) NULL,
    created_at TIMESTAMP NOT NULL,
    content TEXT NOT NULL
);


CREATE TABLE tiw_front (
    id SERIAL PRIMARY KEY,
    font VARCHAR(100) NOT NULL,
    font_weight VARCHAR(100) NOT NULL,
    primary_color VARCHAR(100) NOT NULL,
    nav_color VARCHAR(100) NOT NULL,
    logo VARCHAR(255) NOT NULL,
    created_at TIMESTAMP NOT NULL,
    updated_at TIMESTAMP NOT NULL,
    template VARCHAR(255)  NULL
);


INSERT INTO tiw_front (font, font_weight, primary_color, nav_color, logo, created_at, updated_at) VALUES ('Arial', 'light', '#000000', '#a8d9ff' , 'logo.png', NOW(), NOW());

CREATE TABLE tiw_ip(
    id SERIAL PRIMARY KEY,
    ip VARCHAR(255) NOT NULL,
    created_at TIMESTAMP NOT NULL
);

