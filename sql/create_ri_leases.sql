CREATE TABLE IF NOT EXISTS ri_leases (
  account_id TEXT,
  payer_account_id TEXT,
  account_status_code TEXT,
  ri_instance_count INT,
  ri_start_date DATE,
  ri_duration INT,
  ri_end_date DATE,
  ri_state TEXT,
  ri_external_az TEXT,
  ri_subscription_id TEXT,
  ri_offering_id TEXT,
  ri_lease_id TEXT,
  ri_instance_type TEXT,
  ri_utilization TEXT,
  ri_fixed_price NUMERIC(8, 2),
  ri_os TEXT,
  ri_tenancy TEXT,
  ri_billing_product TEXT,
  ri_billing_resource TEXT,
  ri_recurring_price NUMERIC(8, 6),
  PRIMARY KEY(ri_subscription_id)
);