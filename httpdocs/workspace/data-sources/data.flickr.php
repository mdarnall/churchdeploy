<?php

	require_once(TOOLKIT . '/class.datasource.php');

	Class datasourceflickr extends Datasource{

		public $dsParamROOTELEMENT = 'flickr';
		public $dsParamURL = 'http://api.flickr.com/services/feeds/photos_public.gne?tags=calvery%20chapel';
		public $dsParamXPATH = '/';
		public $dsParamCACHE = '500';
		public $dsParamTIMEOUT = '6';

		public $dsParamFILTERS = array(
				'atom' => 'http://www.w3.org/2005/Atom',
		);

		

		public function __construct(&$parent, $env=NULL, $process_params=true){
			parent::__construct($parent, $env, $process_params);
			$this->_dependencies = array();
		}

		public function about(){
			return array(
				'name' => 'Flickr',
				'author' => array(
					'name' => 'Kirk Strobeck',
					'website' => 'http://accf',
					'email' => 'kirk@strobeck.com'),
				'version' => '1.0',
				'release-date' => '2011-05-17T16:39:59+00:00'
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
