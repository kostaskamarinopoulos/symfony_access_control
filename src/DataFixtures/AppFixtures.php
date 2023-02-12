<?php

namespace App\DataFixtures;

use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Persistence\ObjectManager;
use App\Entity\User;
use App\Entity\Role;
use App\Entity\InterestGroup;
use App\Entity\UserRole;
use App\Entity\Participation;

class AppFixtures extends Fixture
{
    public function load(ObjectManager $manager): void
    {
        
        $names = ['kostas', 'boss', 'nick'];
        for ($i = 0; $i < count($names); $i++) {
            $user = new User();
            $user->setName($names[$i]);
            $user->setPassword('$2y$13$yshMNQxN./OBU9msmbcm6ujXzEhi5mLfOHE0HJm1TLanirr5SSNhu');
            $user->setRoles(['ROLE_ADMIN']);

            $manager->persist($user);

            $group = new InterestGroup();
            $group->setName($names[$i].'Group');
            $manager->persist($group);

            $userGroup = new Participation();
            $userGroup->setInterestGroup($group);
            $userGroup->setUser($user);
            $manager->persist($userGroup);

        }

        $manager->flush();
    }
}
