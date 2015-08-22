FactoryGirl.define do
  factory :empresa do
    name "TEGIK"
    rfc "TEG080425R58"
    despacho
    active true
    factory :empresa_megaprestaciones do
    	rfc "MPR050221E6A"
    	name "MegaPrestaciones"
    end
    factory :empresa_without_despacho do
        despacho_id nil
    end
  end
end
