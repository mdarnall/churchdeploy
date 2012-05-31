<?php

	require_once(TOOLKIT . '/class.datasource.php');

	Class datasourceevents_home_filtered extends Datasource{

		public $dsParamROOTELEMENT = 'events-home-filtered';
		public $dsParamORDER = 'asc';
		public $dsParamPAGINATERESULTS = 'yes';
		public $dsParamLIMIT = '3';
		public $dsParamSTARTPAGE = '1';
		public $dsParamREDIRECTONEMPTY = 'no';
		public $dsParamSORT = 'date';
		public $dsParamHTMLENCODE = 'yes';
		public $dsParamASSOCIATEDENTRYCOUNTS = 'no';

		public $dsParamFILTERS = array(
				'169' => '(if value of ({$pt1}) is not ())',
				'213' => 'no',
				'35' => 'later than {$today}',
		);

		public $dsParamINCLUDEDELEMENTS = array(
				'name',
				'date',
				'description',
				'location: name-formal',
				'location: name-casual'
		);


		public function __construct(&$parent, $env=NULL, $process_params=true){
			parent::__construct($parent, $env, $process_params);
			$this->_dependencies = array();
		}

		public function about(){
			return array(
				'name' => 'Events: Home (filtered)',
				'author' => array(
					'name' => 'Kirk Strobeck',
					'website' => 'http://atheycreek',
					'email' => 'kirk@strobeck.com'),
				'version' => 'Symphony 2.2.5',
				'release-date' => '2012-05-31T02:19:41+00:00'
			);
		}

		public function getSource(){
			return '6';
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
