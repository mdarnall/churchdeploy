<?php

	require_once(TOOLKIT . '/class.datasource.php');
	
	Class datasourceevent_per_id extends Datasource{
		
		public $dsParamROOTELEMENT = 'event-per-id';
		public $dsParamORDER = 'desc';
		public $dsParamLIMIT = '20';
		public $dsParamREDIRECTONEMPTY = 'no';
		public $dsParamPARAMOUTPUT = 'locations';
		public $dsParamSORT = 'system:id';
		public $dsParamSTARTPAGE = '1';
		public $dsParamHTMLENCODE = 'yes';
		public $dsParamASSOCIATEDENTRYCOUNTS = 'no';
		
		public $dsParamFILTERS = array(
				'id' => '{$event-id}',
		);
		
		public $dsParamINCLUDEDELEMENTS = array(
				'name',
				'description: formatted',
				'weekly',
				'locations',
				'contacts',
				'childcare',
				'tags'
		);

		public function __construct(&$parent, $env=NULL, $process_params=true){
			parent::__construct($parent, $env, $process_params);
			$this->_dependencies = array();
		}
		
		public function about(){
			return array(
					 'name' => 'Event per ID',
					 'author' => array(
							'name' => 'Kirk Strobeck',
							'website' => 'http://accf',
							'email' => 'kirk@strobeck.com'),
					 'version' => '1.0',
					 'release-date' => '2011-05-03T19:12:02+00:00');	
		}
		
		public function getSource(){
			return '11';
		}
		
		public function allowEditorToParse(){
			return true;
		}
		
		public function grab(&$param_pool=NULL){
			$result = new XMLElement($this->dsParamROOTELEMENT);
				
			try{
				include(TOOLKIT . '/data-sources/datasource.section.php');
			}
			catch(FrontendPageNotFoundException $e){
				// Work around. This ensures the 404 page is displayed and
				// is not picked up by the default catch() statement below
				FrontendPageNotFoundExceptionHandler::render($e);
			}			
			catch(Exception $e){
				$result->appendChild(new XMLElement('error', $e->getMessage()));
				return $result;
			}	

			if($this->_force_empty_result) $result = $this->emptyXMLSet();
			return $result;
		}
	}

