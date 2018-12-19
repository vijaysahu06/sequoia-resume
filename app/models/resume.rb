class Resume < ApplicationRecord
	has_many :educations
	has_many :experiences
  accepts_nested_attributes_for :educations, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :experiences, reject_if: :all_blank, allow_destroy: true

  validates_presence_of :name
  validates_presence_of :phone
  validates_presence_of :upload_resume_or_linkedin_link
  scope :all_approved, ->{ where(approved: true) }

  #LEVELS = ["Higher Management", "Mid Management", "Others"]
  LEVELS = ["Founder / CEO","Board","CXO","VP","Director","Manager","Individual Contributor"]
  FUNCTIONS=[
              "Operations" ,"Business Development" ,"Sales","Education" ,"Engineering" ,"Information Technology" ,"Administrative" ,"Healthcare Services" ,"Arts and Design" ,"Finance" ,"Support" ,"Community and Social Services" ,"Media and Communication",
              "Accounting","Human Resources","Marketing","Program and Project Management","Research" ,"Legal","Entrepreneurship","Consulting" ,"Military and Protective Services","Real Estate","Quality Assurance","Purchasing","Product Management"
            ]
     
  INDUSTRY = [
               "Accounting","Airlines/Aviation","Alternative Dispute Resolution","Alternative Medicine","Animation","Apparel & Fashion","Architecture & Planning","Arts and Crafts","Automotive","Aviation & Aerospace",
               "Banking","Biotechnology","Broadcast Media","Building Materials","Business Supplies and Equipment",
               "Capital Markets","Chemicals","Civic & Social Organization","Civil Engineering","Commercial Real Estate","Computer & Network Security","Computer Games","Computer Hardware",
               "Computer Networking","Computer Software","Construction","Consumer Electronics","Consumer Goods","Consumer Services","Cosmetics",
               "Dairy","Defense & Space","Design","Education Management","E-Learning","Electrical/Electronic Manufacturing","Entertainment","Environmental Services","Events Services","Executive Office",
               "Facilities Services","Farming","Financial Services","Fine Art","Fishery","Food & Beverages","Food Production","Fund-Raising","Furniture",
               "Gambling & Casinos","Glass, Ceramics & Concrete","Government Administration","Government Relations","Graphic Design",
               "Health, Wellness and Fitness","Higher Education","Hospital & Health Care","Hospitality","Human Resources",
               "Import and Export","Individual & Family Services","Industrial Automation","Information Services","Information Technology and Services","Insurance","International Affairs",
               "International Trade and Development","Internet","Investment Banking","Investment Management","Judiciary",
               "Law Enforcementaw Practice","Legal Services","Legislative Office","Leisure, Travel & Tourism","Libraries","Logistics and Supply Chain","Luxury Goods & Jewelry",
               "Machinery","Management Consulting","Maritime","Marketing and Advertising","Market Research","Mechanical or Industrial Engineering","Media Production","Medical Devices",
               "Medical Practice","Mental Health Care","Military","Mining & Metals","Motion Pictures and Film","Museums and Institutions","Music","Nanotechnology","Newspapers","Nonprofit Organization Management",
               "Oil & Energy","Online Media","Outsourcing/Offshoring","Package/Freight Delivery","Packaging and Containers","Paper & Forest Products","Performing Arts","Pharmaceuticals","Philanthropy",
               "Photography","Plastics","Political Organization","Primary/Secondary Education","Printing","Professional Training & Coaching","Program Development","Public Policy","Public Relations and Communications","Public Safety","Publishing",
               "Railroad Manufacture","Ranching","Real Estate","Recreational Facilities and Services","Religious Institutions","Renewables & Environment","Research","Restaurants","Retail",
               "Security and Investigations","Semiconductors","Shipbuilding","Sporting Goods","Sports","Staffing and Recruiting","Supermarkets","Telecommunications","Textiles","Think Tanks","Tobacco",
               "Translation and Localization","Transportation/Trucking/Railroad","Utilities","Venture Capital & Private Equity","Veterinary","Warehousing","Wholesale","Wine and Spirits","Wireless","Writing and Editing"
              ]
  ADDITIONAL_INDUSTRY = [
                           "Accounting","Airlines/Aviation","Alternative Dispute Resolution","Alternative Medicine","Animation","Apparel & Fashion","Architecture & Planning","Arts and Crafts","Automotive","Aviation & Aerospace",
                           "Banking","Biotechnology","Broadcast Media","Building Materials","Business Supplies and Equipment",
                           "Capital Markets","Chemicals","Civic & Social Organization","Civil Engineering","Commercial Real Estate","Computer & Network Security","Computer Games","Computer Hardware",
                           "Computer Networking","Computer Software","Construction","Consumer Electronics","Consumer Goods","Consumer Services","Cosmetics",
                           "Dairy","Defense & Space","Design","Education Management","E-Learning","Electrical/Electronic Manufacturing","Entertainment","Environmental Services","Events Services","Executive Office",
                           "Facilities Services","Farming","Financial Services","Fine Art","Fishery","Food & Beverages","Food Production","Fund-Raising","Furniture",
                           "Gambling & Casinos","Glass, Ceramics & Concrete","Government Administration","Government Relations","Graphic Design",
                           "Health, Wellness and Fitness","Higher Education","Hospital & Health Care","Hospitality","Human Resources",
                           "Import and Export","Individual & Family Services","Industrial Automation","Information Services","Information Technology and Services","Insurance","International Affairs",
                           "International Trade and Development","Internet","Investment Banking","Investment Management","Judiciary",
                           "Law Enforcementaw Practice","Legal Services","Legislative Office","Leisure, Travel & Tourism","Libraries","Logistics and Supply Chain","Luxury Goods & Jewelry",
                           "Machinery","Management Consulting","Maritime","Marketing and Advertising","Market Research","Mechanical or Industrial Engineering","Media Production","Medical Devices",
                           "Medical Practice","Mental Health Care","Military","Mining & Metals","Motion Pictures and Film","Museums and Institutions","Music","Nanotechnology","Newspapers","Nonprofit Organization Management",
                           "Oil & Energy","Online Media","Outsourcing/Offshoring","Package/Freight Delivery","Packaging and Containers","Paper & Forest Products","Performing Arts","Pharmaceuticals","Philanthropy",
                           "Photography","Plastics","Political Organization","Primary/Secondary Education","Printing","Professional Training & Coaching","Program Development","Public Policy","Public Relations and Communications","Public Safety","Publishing",
                           "Railroad Manufacture","Ranching","Real Estate","Recreational Facilities and Services","Religious Institutions","Renewables & Environment","Research","Restaurants","Retail",
                           "Security and Investigations","Semiconductors","Shipbuilding","Sporting Goods","Sports","Staffing and Recruiting","Supermarkets","Telecommunications","Textiles","Think Tanks","Tobacco",
                           "Translation and Localization","Transportation/Trucking/Railroad","Utilities","Venture Capital & Private Equity","Veterinary","Warehousing","Wholesale","Wine and Spirits","Wireless","Writing and Editing"
   
                         ]
  WILLING_TO_RELOCATE = ["Yes", "No", "May be"]

  def upload_resume_or_linkedin_link
    if (self.linkedin_link.present? || self.upload_resume.present?)
      return true
    else
      errors.add(:linkedin_link, " or Upload Resume, can't be blank! Must provide any one of this.")
    end
  end

  def total_experience
    "#{experience_in_years} years and #{experience_in_months} months"
  end
end
