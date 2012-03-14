<?php

	require_once(TOOLKIT . '/class.datasource.php');

	Class datasourcexml_apibibliacom extends Datasource{

		public $dsParamROOTELEMENT = 'xml-apibibliacom';
		public $dsParamURL = 'http://api.biblia.com/v1/bible/content/kjv.xml?key=75a4b16582635a69f1194f670abfa9f0&passage={$ds-verses-entries-by-tag:encoded}';
		public $dsParamXPATH = '/response/text';
		public $dsParamCACHE = '999999';
		public $dsParamTIMEOUT = '6';

		

		

		public function __construct(&$parent, $env=NULL, $process_params=true){
			parent::__construct($parent, $env, $process_params);
			$this->_dependencies = array('$ds-verses-entries-by-tag');
		}

		public function about(){
			return array(
				'name' => 'XML: api.biblia.com',
				'author' => array(
					'name' => 'Kirk Strobeck',
					'website' => 'http://72.10.33.203',
					'email' => 'kirk@strobeck.com'),
				'version' => 'Symphony 2.2.5',
				'release-date' => '2012-03-14T03:49:32+00:00'
			);
		}

		public function getSource(){
			return 'dynamic_xml';
		}

		public function allowEditorToParse(){
			return true;
		}

		public function grab(&$param_pool=NULL){
			$result = new XMLElement($this->dsParamROOTELEMENT);

			try{
				include(TOOLKIT . '/data-sources/datasource.dynamic_xml.php');
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
