<?php

/**
 * Проверка правильности логики класса  Totalizator
 * 
 */

require 'Totalizator.php';
 
class TotalizotorTests extends \PHPUnit\Framework\TestCase
{
    private $totalizator;
 
    protected function setUp()
    {
        $this->totalizator = new Totalizator();
    }
 
    protected function tearDown()
    {
        $this->totalizator = NULL;
    }
 
    public function testGetSkore()
    {
        $result = $this->totalizator->getSkore(0, 1, 0, 1);
        $this->assertEquals(1, $result);
        $result = $this->totalizator->getSkore(2, 1, 1, 0);
        $this->assertEquals(0, $result);
        $result = $this->totalizator->getSkore(0, 4, 2, 0);
        $this->assertEquals(-1, $result);
        $result = $this->totalizator->getSkore(2, 4, 1, 4);
        $this->assertEquals(0, $result);
        $result = $this->totalizator->getSkore(3, 3, 2, 2);
        $this->assertEquals(0, $result);
    }
 
}