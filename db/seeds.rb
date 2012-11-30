# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Added by Refinery CMS Pages extension
Refinery::Pages::Engine.load_seed

home = Refinery::Page.where(link_url: "/")
unless home.empty?
  home.first.update_attribute(:show_in_menu, false)
end

if Refinery::Page.where(link_url: "/about-us").empty?
  I18n.locale = :en
  about_page = Refinery::Page.create(title: "About us")
  about_page.parts.create(
    title: "Body",
    position: 0,
    body: <<-EOF
          <p><abbr title="European Network of Teratology Information Services" class="initialism"><strong class="blue">ENTIS</strong></abbr> was founded in Milan in May 1990.</p>
          <p>The <strong class="blue">general objective</strong> for ENTIS is to coordinate and collaborate the activities of the different Teratology Information Services (TIS), and to collect and evaluate data in order to contribute to the primary prevention of birth defects and developmental disorders.</p>
          <p>A <strong class="blue">teratogen</strong> is an environmental agent such as a drug, chemical, virus or pollutant which interferes with the normal development of the embryo or fetus.</p>
          <p><strong class="blue">Congenital anomalies</strong> constitute a considerable burden for the affected person, his family and the society. Every women in every pregnancy has a 3-4% risk of having a child with a significant birth defect. About 10 percent of birth defects are related to drugs, chemicals, infections, known maternal illnesses or other exposures.</p>
          <p><strong class="blue">Birth defects caused by teratogens can be prevented.</strong> The main task of each TIS is to recognize and to detect risk factors with the objective of preventing birth defects. To execute this task each TIS counsels individual cases with exposure to drugs and other exogenous agents during pregnancy with respect to the risk of reproductive toxicity. The information provided is based on current sientific data, which is collected and analyzed by each TIS staff.<br />
          The service provided is free of charge. Some centers limit the counseling to health care providers, while others are also open to the general public. Check the specific TIS for more details.</p>
          EOF
  )
end

# Added by Refinery CMS Centers extension
Refinery::Centers::Engine.load_seed

if Refinery::Page.by_title("Q&A").empty?
  I18n.locale = :en
  qa_page = ::Refinery::Page.create(title: "Q&A")
    qa_page.parts.create(
      title: "Body",
      position: 0,
      body: <<-EOF
            <p><strong class="blue">Teratology Information Services</strong> (TIS) provide information on the possible risks of exposure to drugs and other exogenous agents during pregnancy and lactation.</p>

            <p>Teratology Information Services are consulted by the medical profession and other health care professionals, some of them counsel lay people as well. Answers provided are specifically oriented towards individual patients.  Detailed knowledge of dose, time of exposure, adverse effects on the mother related to the exposure, diseases, previous pregnancies, family history of the patient and the pharmacological and toxicological properties of the agents have to be taken into account to make a specific risk assessment.</p>

            <p class="muted"><small>When you have a specific question. Please check the <a href="/members">Members</a> section for the TIS in your area.</small>
            </p>

            <p><strong>A TIS deals with the following types of inquiries:</strong>
            </p>

            <h3>Before pregnancy</h3>
            <ul>
              <li>A couple is planning a pregnancy and is being exposed to drugs/chemicals.
                <ul class="text-info">
                  <li>What is the risk?</li>
                  <li>Should this exposure be changed or stopped?</li>
                  <li>Does this exposure decrease fertility?</li>
                </ul>
              </li>
            </ul>

            <h3>During pregnancy</h3>
            <ul>
              <li>A pregnant woman has taken a drug before she realises that she is pregnant
                <ul class="text-info">
                  <li>What is the risk?</li>
                  <li>Would recommending termination of pregnancy be justified?</li>
                  <li>What prenatal diagnostic procedures can be offered?</li>
                </ul>
              </li>
              <li>A drug has to be prescribed to a pregnant woman
                <ul class="text-info">
                  <li>Is it safe?</li>
                  <li>Is there a less toxic/teratogenic drug with comparable therapeutic efficacy to which the woman should be transferred?</li>
                  <li>Is the risk of taking a drug greater than the risk of the disease for which the drug is taken?</li>
                  <li>Are there risks acceptable to the patient when compared with the spontaneous risk of developmental disorders?</li>
                </ul>
              </li>
              <li>A pregnant woman has attempted to commit suicide by taking an overdose of a drug.
                <ul class="text-info">
                  <li>What information should be given to the physician at the emergency department?</li>
                  <li>Can the appropriate antidote be given to her?</li>
                </ul>
              </li>
              <li>A pregnant woman is addicted to drugs/alcohol.
                <ul class="text-info">
                  <li>Do they have an adverse effect on the course of pregnancy?</li>
                  <li>What are the effects on fetal development?</li>
                  <li>Can neonatal problems be expected or are there any long-term consequences for the child?</li>
                </ul>
              </li>
              <li>A pregnant woman is exposed at work to certain chemicals.
                <ul class="text-info">
                  <li>What is the risk?</li>
                  <li>Should she continue this work?</li>
                </ul>
              </li>
              <li>A pregnant woman is exposed to an infectious agent.
                <ul class="text-info">
                  <li>What are the risks of a maternal infection for the fetus?</li>
                  <li>Are techniques available for the diagnosis of a fetal infection and what are the management options?</li>
                  <li>Similar questions are made for non-infectious maternal diseases.</li>
                </ul>
              </li>
              <li>A pregnant woman has been exposed to...
                <ul class="text-info">
                  <li>What are the risks of certain physical exposures such as heat and radiation (especially x-rays and radioactive materials), vaccinations or environmental pollution?</li>
                </ul>
              </li>
              <li>A man has been exposed to chemicals or has been treated with drugs.
                <ul class="text-info">
                  <li>Are there any paternally mediated risks for the fetus or baby?</li>
                </ul>
              </li>
            </ul>
            <h3>After Pregnancy</h3>
            <ul>
              <li>A baby is born with a birth defect or a neonatal disorder.
                <ul class="text-info">
                  <li>Can this be attributed to a drug or chemical to which the mother was exposed before or during pregnancy?</li>
                </ul>
              </li>
              <li>A drug has to be prescribed to a mother while she is breastfeeding. A mother uses a prescription drug or is exposed to an other exogenous agent, while breastfeeding.
                <ul class="text-info">
                  <li>What is the (relative) dose the neonate (infant) is exposed to?</li>
                  <li>Is this acceptable for its age?</li>
                  <li>What is the treatment of choice during breastfeeding?</li>
                </ul>
              </li>
            </ul>

            <p class="muted"><small>When you have a specific question. Please check the <a href="/members">Members</a> section for the TIS in your area.</small>
            </p>
            EOF
  )
end

# Added by Refinery CMS Search engine
Refinery::Search::Engine.load_seed

# Added by Refinery CMS Publications extension
Refinery::Publications::Engine.load_seed

links_page = Refinery::Page.by_title("Links")
if links_page.empty?
  I18n.locale = :en
  links_page = ::Refinery::Page.create(title: "Links")
  links_page.parts.create(
    title: "Body",
    position: 0,
    body: <<-EOF
          <h2>Societies</h2>

          <ul>

            <li><a href="http://www.otispregnancy.org/">Organization
    of Teratology Information Services (OTIS)</a> </li>

            <li><a href="http://www.teratology.org/">Teratology Society</a> </li>

            <li><a href="http://www.etsoc.com/">European Teratology Society</a> </li>

            <li><a href="http://www.motherisk.org/">Motherisk</a> </li>

            <li><a href="http://www.ems-us.org/">Environmental Mutagen Society</a> </li>
          </ul>
          <h2>Journals and Resources</h2>

          <ul>

            <li><a href="http://www.elsevier.com/wps/find/journaldescription.cws_home/525489/description#description">Reproductive Toxicology</a> </li>

            <li><a href="http://depts.washington.edu/%7Eterisweb/">Clinical
    Teratology Web</a> </li>

            <li><a href="http://depts.washington.edu/%7Eterisweb/teris/index.html">Teratogen Information System
    (TERIS)</a> </li>

            <li><a href="http://www.reprotox.org/">Reprotox</a> </li>

            <li><a href="http://www.nih.gov/">NIH</a> </li>

            <li><a href="http://www.cdc.gov/">Centers
    for Disease Control and Prevention</a>
    </li>
          </ul>

          <h2>Other Links</h2>

          <ul>

            <li><a href="http://www.med.upenn.edu/meded/public/berp/index.html">Basic Embryology Review Program</a></li>

            <li><a href="http://cerhr.niehs.nih.gov/index.html">The
    National Toxicology Program</a> </li>

            <li><a href="http://www.visembryo.com/baby/index.html">The
    Visible Embryo</a> </li>

            <li><a href="http://www.icbd.org">How
    to prevent congenital malformations</a></li>

            <li><a href="http://www.ifts-atlas.org/ifts/index.html">IFTS Atlas</a> </li>

            <li><a href="http://www.lecrat.org">Centre de reference sur les agents teratogenes</a> </li>
            <li><a href="http://www.embryotox.de">Arzneimittelsicherheit in Schwangerschaft und Stillzeit</a> </li>
          </ul>
          EOF
  )
end

# Added by Refinery CMS News engine
Refinery::News::Engine.load_seed

contact_page = Refinery::Page.by_title("Contact")
if contact_page.empty?
  I18n.locale = :en
  contact_page = Refinery::Page.create(title: "Contact", show_in_menu: false)
  contact_page.parts.create(
    title: "Body",
    position: 0,
    body: <<-EOF
          <p>When you have a specific question regarding pregnancy or lactation. Please check the <a href="/centers" title="Centers">Centers</a> section for the TIS in your area.</p>

          <p>For questions regarding <strong>ENTIS&#160;membership</strong> contact the <strong>ENTIS&#160;</strong>secretary <strong>Svetlana Shechtman.</strong>
          <br />
          Email: <a href="mailto:svetlana.shechtman@moh.health.gov.il"><strong>svetlana.shechtman@moh.health.gov.il</strong> </a> </p>
          EOF
  )
end

# Added by Refinery CMS Memberships engine
Refinery::Memberships::Engine.load_seed
