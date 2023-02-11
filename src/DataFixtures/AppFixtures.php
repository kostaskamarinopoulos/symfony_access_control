<?php

namespace App\DataFixtures;

use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Persistence\ObjectManager;
use App\Entity\User;
use App\Entity\Role;
use App\Entity\Group;
use App\Entity\UserRole;

class AppFixtures extends Fixture
{
    public function load(ObjectManager $manager): void
    {
        
        $names = ['kostas', 'boss'];
        for ($i = 0; $i < count($names); $i++) {
            $user = new User();
            $user->setName($names[$i]);

            $group = new Group();
            $group->setName($names[$i].'Group');

            $userGroup = new UserCategory();
            $userGroup->setGroup($group);
            $userGroup->setUser($user);
            $manager->persist($userGroup);

        }

        $manager->flush();
    }
}
