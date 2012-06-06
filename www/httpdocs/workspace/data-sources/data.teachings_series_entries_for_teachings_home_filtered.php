<?php

	require_once(TOOLKIT . '/class.datasource.php');

	Class datasourceteachings_series_entries_for_teachings_home_filtered extends Datasource{

		public $dsParamROOTELEMENT = 'teachings-series-entries-for-teachings-home-filtered';
		public $dsParamORDER = 'asc';
		public $dsParamPAGINATERESULTS = 'yes';
		public $dsParamLIMIT = '12';
		public $dsParamSTARTPAGE = '1';
		public $dsParamREDIRECTONEMPTY = 'no';
		public $dsParamSORT = 'order';
		public $dsParamHTMLENCODE = 'yes';
		public $dsParamASSOCIATEDENTRYCOUNTS = 'no';

		public $dsParamFILTERS = array(
				'221' => 'no',
				'118' => '(if value of ({$pt2}) is (teachings))',
				'233' => 'no',
				'216' => 'no',
				'232' => '(if value of ({$pt2}) is (teachings))',
		);

		public $dsParamINCLUDEDELEMENTS = array(
				'title',
				'poster',
				'teachings: title'
		);


		public function __construct(&$parent, $env=NULL, $process_params=true){
			parent::__construct($parent, $env, $process_params);
			$this->_dependencies = array();
		}

		public function about(){
			return array(
				'name' => 'Teachings: Series: Entries for teachings home (filtered)',
				'author' => array(
					'name' => 'Kirk Strobeck',
					'website' => 'http://atheycreek',
					'email' => 'kirk@strobeck.com'),
				'version' => 'Symphony 2.2.5',
				'release-date' => '2012-06-06T16:25:43+00:00'
			);
		}

		public function getSource(){
			return '27';
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
