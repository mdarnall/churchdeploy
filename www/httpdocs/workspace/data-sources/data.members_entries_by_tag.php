<?php

	require_once(TOOLKIT . '/class.datasource.php');

	Class datasourcemembers_entries_by_tag extends Datasource{

		public $dsParamROOTELEMENT = 'members-entries-by-tag';
		public $dsParamORDER = 'asc';
		public $dsParamPAGINATERESULTS = 'no';
		public $dsParamLIMIT = '20';
		public $dsParamSTARTPAGE = '1';
		public $dsParamREDIRECTONEMPTY = 'no';
		public $dsParamREQUIREDPARAM = '$pt1:43';
		public $dsParamSORT = 'order';
		public $dsParamHTMLENCODE = 'yes';
		public $dsParamASSOCIATEDENTRYCOUNTS = 'no';

		public $dsParamFILTERS = array(
				'55' => '{$pt1:43}',
		);

		public $dsParamINCLUDEDELEMENTS = array(
				'system:pagination',
				'first-name',
				'last-name',
				'photo',
				'email',
				'job-title: raw',
				'gender',
				'password',
				'activation',
				'role',
				'role: permissions',
				'about'
		);


		public function __construct(&$parent, $env=NULL, $process_params=true){
			parent::__construct($parent, $env, $process_params);
			$this->_dependencies = array();
		}

		public function about(){
			return array(
				'name' => 'Members: Entries by tag',
				'author' => array(
					'name' => 'Kirk Strobeck',
					'website' => 'http://churchdeploy',
					'email' => 'kirk@strobeck.com'),
				'version' => 'Symphony 2.2.5',
				'release-date' => '2011-12-03T02:46:01+00:00'
			);
		}

		public function getSource(){
			return '1';
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