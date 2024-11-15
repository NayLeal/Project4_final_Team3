CREATE TABLE properties (
    property_id INT PRIMARY KEY,
    PID INT NOT NULL,
    MS_SubClass INT,
    MS_Zoning VARCHAR(20),
    Neighborhood VARCHAR(50),
    Bldg_Type VARCHAR(20),
    House_Style VARCHAR(20),
    Overall_Qual INT,
    Overall_Cond INT,
    Year_Built INT,
    Year_Remod_Add INT
);

CREATE TABLE lots (
    lot_id SERIAL PRIMARY KEY,
    property_id INT,
    Lot_Frontage DECIMAL(5,2),
    Lot_Area INT,
    Street VARCHAR(10),
    Alley VARCHAR(10),
    Lot_Shape VARCHAR(10),
    Land_Contour VARCHAR(10),
    Lot_Config VARCHAR(10),
    Land_Slope VARCHAR(10),
    Utilities VARCHAR(10),
    FOREIGN KEY (property_id) REFERENCES properties(property_id)
);

CREATE TABLE construction (
    construction_id SERIAL PRIMARY KEY,
    property_id INT,
    Roof_Style VARCHAR(20),
    Roof_Matl VARCHAR(20),
    Exterior_1st VARCHAR(20),
    Exterior_2nd VARCHAR(20),
    Foundation VARCHAR(20),
    Heating VARCHAR(10),
    Heating_QC VARCHAR(10),
    Central_Air CHAR(1),
    Electrical VARCHAR(10),
    Exter_Qual VARCHAR(10),
    Exter_Cond VARCHAR(10),
    FOREIGN KEY (property_id) REFERENCES properties(property_id)
);

CREATE TABLE extra_features (
    feature_id SERIAL PRIMARY KEY,
    property_id INT,
    Fireplaces INT,
    Fireplace_Qu VARCHAR(10),
    Garage_Type VARCHAR(20),
    Garage_Area INT,
    Garage_Cars INT,
    Wood_Deck_SF INT,
    Open_Porch_SF INT,
    Enclosed_Porch INT,
    Screen_Porch INT,
    Pool_Area INT,
    Pool_QC VARCHAR(10),
    Fence VARCHAR(10),
    Misc_Feature VARCHAR(20),
    Misc_Val INT,
    FOREIGN KEY (property_id) REFERENCES properties(property_id)
);

CREATE TABLE sales (
    sale_id SERIAL PRIMARY KEY,
    property_id INT,
    SalePrice DECIMAL(10,2),
    Sale_Type VARCHAR(20),
    Sale_Condition VARCHAR(20),
    Mo_Sold INT,
    Yr_Sold INT,
    FOREIGN KEY (property_id) REFERENCES properties(property_id)
);
