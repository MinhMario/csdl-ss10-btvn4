
-- 1. TẠO BẢNG VÀ DỮ LIỆU MẪU

CREATE TABLE Pharmacy_Inventory (
    Inventory_ID  INT AUTO_INCREMENT PRIMARY KEY,
    Drug_Name     VARCHAR(255),
    Batch_Number  VARCHAR(50),
    Expiry_Date   DATE,
    Quantity      INT
);

INSERT INTO Pharmacy_Inventory (Drug_Name, Batch_Number, Expiry_Date, Quantity)
VALUES
    ('Paracetamol',  'B001', '2025-12-01', 100),
    ('Amoxicillin',  'B002', '2024-06-15', 200),
    ('Ibuprofen',    'B003', '2026-03-20', 150),
    ('Paracetamol',  'B004', '2024-01-10', 50),
    ('Metformin',    'B005', '2025-09-30', 300);


-- Cách 1: 2 Index đơn độc lập
CREATE INDEX idx_drug_name    ON Pharmacy_Inventory(Drug_Name);
CREATE INDEX idx_expiry_date  ON Pharmacy_Inventory(Expiry_Date);

-- Cách 2: 1 Composite Index trên cả 2 cột
CREATE INDEX idx_drug_expiry  ON Pharmacy_Inventory(Drug_Name, Expiry_Date);



EXPLAIN SELECT * FROM Pharmacy_Inventory
WHERE Drug_Name = 'Paracetamol' AND Expiry_Date < '2025-01-01';


EXPLAIN SELECT * FROM Pharmacy_Inventory
WHERE Drug_Name LIKE '%acetam%';

EXPLAIN SELECT * FROM Pharmacy_Inventory
WHERE Drug_Name LIKE 'Para%';