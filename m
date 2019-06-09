Return-Path: <squashfs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+squashfs-devel@lfdr.de
Delivered-To: lists+squashfs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B7193A411
	for <lists+squashfs-devel@lfdr.de>; Sun,  9 Jun 2019 08:59:27 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <squashfs-devel-bounces@lists.sourceforge.net>)
	id 1hZrnY-0005Fg-P4; Sun, 09 Jun 2019 06:59:24 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <guanx.bac@gmail.com>)
 id 1hZrnX-0005FW-MZ; Sun, 09 Jun 2019 06:59:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wLogyVCPd7NWosq8OK4rdu8FvZ+4FftiNowwnEJ5ZGk=; b=eKqDG8CxIEuTV9AjrXEZVFfysr
 ErdKVowiO8HgX1VbpbhSL50T71mkxhKvwkHfrFJDymOexHWTkoH4FJseLgYhZOsMF8Y6Nlq4RRtRr
 kJnmCM4GEI1PJ9DxLnsqn02H/JK9mKqfYEFQDzdMXNaBW6dbG97seMfUj5yKgT+oWZZI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=wLogyVCPd7NWosq8OK4rdu8FvZ+4FftiNowwnEJ5ZGk=; b=UnWcZCDkXhX+XlMcM4iG+gZl+i
 EpB7LjotyYUhUwsl/nxXUAlGKfFl12IvCXlkj2hPtGMwbILaHoVEnyTF/zug4cmGK20+nPSwWQfB5
 hpYfLMbH2vxdO+5DqbKvM30NDt6Grjc9SNiXNaqbKlRqlaYwz81CLFBBhG1WvefjVGM4=;
Received: from mail-ot1-f44.google.com ([209.85.210.44])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.90_1)
 id 1hZrnW-003lyG-Tm; Sun, 09 Jun 2019 06:59:24 +0000
Received: by mail-ot1-f44.google.com with SMTP id r10so5583475otd.4;
 Sat, 08 Jun 2019 23:59:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wLogyVCPd7NWosq8OK4rdu8FvZ+4FftiNowwnEJ5ZGk=;
 b=BsPhuDWjMDiXGPXlvhYQLs7Z2ZdZmz0WqsUsgDyiPkcVbXW2JGGgZU6tLd6YgNG29+
 hacx4G7i+CYg8SyVLboKHRolKBlmqFCNAOJHFOJmSMMoQ49+j3u3xoufpxCWoxMKwNPh
 oIuGL9pbyDjZYNrv+hT8CgvFkWFfM6eOVDjYcDJmeQsUX1KWhTyYE3ktp27zVgiBuzzi
 oBJgsdJMyTVDBytmw8f070cZCbRxX9gEdYqxn6aTDp2Sqn6tFynGfnTJv6MUSMz8hg7m
 6Fk7y0e/nykZFqEHMmu8D+aBkg46gdMVp9xf98EhylglTL7emU5f0QrKIBF/KdCitVas
 FevQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wLogyVCPd7NWosq8OK4rdu8FvZ+4FftiNowwnEJ5ZGk=;
 b=lpe6V3BsegNwb12aOmPOUYM6USbZeaOTpo9RfUNlFfxUgOmvQx+ysbcyBg/7pbMzEG
 QQFnxH+4ke4lirGotApbNEWzas4dvnD4PTNqsgIcMN4NUPRyUhuKCSXVF5qhEro+sieW
 mQvS81TOp8dwdO8hk9mQ6slk+xhG+Fcz91Xhzsx6p1dM1JOEXi01wJ9nVZHGer+X6zVm
 +cfSwD1RsCW+RxVRHyBdg/UUaPWsw94rxLlndBLYqzt2YLmuxX4XfpCcAsFTLB/TRzlm
 gWszYH3gKvnnoY56MrxNYl1KJ9uzxkUbnJN/i4vI2pvrdmNRLqkiA2CkUoqYhKj8Myqm
 O2SQ==
X-Gm-Message-State: APjAAAVgxvzBxydLlvCwJawuk6pxJC6aKmGzm1agIUg1kfi1q7gwee0V
 HD8LnXcvicnhQ6pwD/6efAXxWVS+mEPuy/aEyn6rLvACl5s=
X-Google-Smtp-Source: APXvYqxjbscNyx+23YmNUO74zoRF/+SCaldKLWMv9Jqft8QZkV/5qvWdG1EDK7kOarb6gxUZEQXEiQFgBLtdzBliaEs=
X-Received: by 2002:a9d:48f:: with SMTP id 15mr24866485otm.160.1560063556306; 
 Sat, 08 Jun 2019 23:59:16 -0700 (PDT)
MIME-Version: 1.0
References: <c6a517ac-05f3-91ec-8906-ce8651be5095@infraroot.at>
In-Reply-To: <c6a517ac-05f3-91ec-8906-ce8651be5095@infraroot.at>
From: Guan Xin <guanx.bac@gmail.com>
Date: Sun, 9 Jun 2019 14:58:39 +0800
Message-ID: <CANeMGR5FuT=gCdnk86byGTqz6YGcaC4dvxpC13Ekm0FtdbJWrQ@mail.gmail.com>
To: Goliath <goliath@infraroot.at>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (guanx.bac[at]gmail.com)
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.210.44 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1hZrnW-003lyG-Tm
Subject: Re: [Squashfs-devel] [ANNOUNCE] squashfs-tools-ng 0.1
X-BeenThere: squashfs-devel@lists.sourceforge.net
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <squashfs-devel.lists.sourceforge.net>
List-Unsubscribe: <https://lists.sourceforge.net/lists/options/squashfs-devel>, 
 <mailto:squashfs-devel-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=squashfs-devel>
List-Post: <mailto:squashfs-devel@lists.sourceforge.net>
List-Help: <mailto:squashfs-devel-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/squashfs-devel>, 
 <mailto:squashfs-devel-request@lists.sourceforge.net?subject=subscribe>
Cc: squashfs-devel@lists.sourceforge.net,
 squashfs-announce@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: squashfs-devel-bounces@lists.sourceforge.net

Hi,

Interesting tool! Nice to have it with syntax similar to that of
archive utilities.

BTW, "empty directories cannot have xattrs" -- Might actually be implemented.
Just tried with squash-tools 4.3 with setfattr on empty dir/mksquashfs
-xattrs/mount
and getfattr succeeded.

Regards,
Guan

On Sun, Jun 9, 2019 at 9:49 AM Goliath <goliath@infraroot.at> wrote:
>
> Hi,
>
> after running into a bunch of limitations with the existing tools, I took
> the liberty of piecing together a new squashfs packer and extractor that
> intend to be feature wise compatible with the existing ones, but with a
> few important improvements, such as:
>
>  - Tooling inspired to `gen_init_cpio` from the kernel
>    - Easy micro management of the file system structure
>    - Precise control of permissions and ownership
>    - Allows non-root users to easily build images with e.g. SUID binaries
>      and device special files
>  - SELinux support through SELinux context files (see selabel_file(5))
>  - Deterministic, reproducible image generation
>
>
> My initial plan was to integrate this into upstream squashfs-tools, but
> upstream development appears to be pretty stale and the code base itself
> is actually in a fairly messy state, so I started afresh.
>
> The programs in the package have been specifically named to not clash with
> the existing tools, so they can be installed and used side by side.
>
> For the time being, I published the git tree on GitHub. A link to a release
> tarball can also be found below.
>
> I only did some basic testing so far with a few variations of root file systems
> that I could boot from in Qemu and on some embedded boards I have sitting
> around.
>
> Any feedback would be welcome.
>
>
> Release tarball: https://infraroot.at/pub/squashfs/squashfs-tools-ng-0.1.tar.xz
>
> git tree: https://github.com/AgentD/squashfs-tools-ng
>
>
> Regards,
>
> David
>
>
> _______________________________________________
> Squashfs-devel mailing list
> Squashfs-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/squashfs-devel


_______________________________________________
Squashfs-devel mailing list
Squashfs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/squashfs-devel
