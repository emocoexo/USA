-- Users Table
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  username VARCHAR(50) UNIQUE NOT NULL,
  email VARCHAR(100) UNIQUE NOT NULL,
  password_hash VARCHAR(255) NOT NULL,
  api_key VARCHAR(255) UNIQUE NOT NULL,
  full_name VARCHAR(100),
  avatar_url VARCHAR(255),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Storyboards Table
CREATE TABLE storyboards (
  id SERIAL PRIMARY KEY,
  user_id INTEGER NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  title VARCHAR(255) NOT NULL,
  description TEXT,
  template_type VARCHAR(50),
  content JSONB,
  thumbnail_url VARCHAR(255),
  is_public BOOLEAN DEFAULT FALSE,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Affiliate Links Table
CREATE TABLE affiliate_links (
  id SERIAL PRIMARY KEY,
  user_id INTEGER NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  storyboard_id INTEGER REFERENCES storyboards(id) ON DELETE CASCADE,
  affiliate_url VARCHAR(500) NOT NULL,
  product_name VARCHAR(255),
  product_image_url VARCHAR(255),
  commission_percentage DECIMAL(5,2),
  click_count INTEGER DEFAULT 0,
  conversion_count INTEGER DEFAULT 0,
  total_commission DECIMAL(10,2) DEFAULT 0,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Analytics Table
CREATE TABLE analytics (
  id SERIAL PRIMARY KEY,
  user_id INTEGER NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  affiliate_link_id INTEGER REFERENCES affiliate_links(id) ON DELETE CASCADE,
  event_type VARCHAR(50),
  event_data JSONB,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create Indexes
CREATE INDEX idx_users_email ON users(email);
CREATE INDEX idx_users_api_key ON users(api_key);
CREATE INDEX idx_storyboards_user_id ON storyboards(user_id);
CREATE INDEX idx_affiliate_links_user_id ON affiliate_links(user_id);
CREATE INDEX idx_analytics_user_id ON analytics(user_id);