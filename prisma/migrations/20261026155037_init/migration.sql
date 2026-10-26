-- CreateTable
CREATE TABLE "DeliveryPartner" (
    "id" TEXT NOT NULL,
    "mobile" TEXT NOT NULL,
    "name" TEXT,
    "isActive" BOOLEAN NOT NULL DEFAULT true,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "DeliveryPartner_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "DeliveryPartnerAccount" (
    "id" TEXT NOT NULL,
    "deliveryPartnerId" TEXT NOT NULL,
    "service" TEXT NOT NULL,
    "sourcePartnerId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "DeliveryPartnerAccount_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "DeliveryPartner_mobile_key" ON "DeliveryPartner"("mobile");

-- CreateIndex
CREATE INDEX "DeliveryPartnerAccount_deliveryPartnerId_idx" ON "DeliveryPartnerAccount"("deliveryPartnerId");

-- CreateIndex
CREATE UNIQUE INDEX "DeliveryPartnerAccount_service_sourcePartnerId_key" ON "DeliveryPartnerAccount"("service", "sourcePartnerId");

-- CreateIndex
CREATE UNIQUE INDEX "DeliveryPartnerAccount_deliveryPartnerId_service_key" ON "DeliveryPartnerAccount"("deliveryPartnerId", "service");

-- AddForeignKey
ALTER TABLE "DeliveryPartnerAccount" ADD CONSTRAINT "DeliveryPartnerAccount_deliveryPartnerId_fkey" FOREIGN KEY ("deliveryPartnerId") REFERENCES "DeliveryPartner"("id") ON DELETE CASCADE ON UPDATE CASCADE;
